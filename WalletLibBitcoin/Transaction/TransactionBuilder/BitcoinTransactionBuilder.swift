//
//  BitcoinTransactionBuilder.swift
//  WalletLibBitcoin
//
//

import Foundation


public class BitcoinTransactionBuilder<T: BitcoinTemplateTransaction> {
    
    
    public let params: BitcoinTransactionParameters
    
    
    public let settings: BitcoinTransactionSettings
    
    
    public let utilAddressVersion: AddressVersionUtilProtocol

    
    public var calculator: FeeCalculator

    
    /// Init
    /// - Parameter amount: Amount for spending (in Satoshis)
    /// - Parameter addresss: Base58 encoded recipient bitcoin address string
    /// - Parameter changeAddress: Base58 encoded bitcoin address for change string
    /// - Parameter utxo: Unspent outputs
    /// - Parameter isSendAll: This flag indicates that the maximum available quantity will be sent
    /// - Parameter settings: Transaction build settings
    public init(params: BitcoinTransactionParameters, settings: BitcoinTransactionSettings, util: AddressVersionUtilProtocol) {

        self.params = params
        
        self.settings = settings
        
        self.utilAddressVersion = util
        
        calculator = FeeCalculator(amount: params.amount, utxo: params.utxo, isSendAll: params.isSendAll, dust: params.dust, settings: settings)
    }
    
    
    /// Transaction creation
    /// - Parameter feePerByte: Transaction fee value per byte in Satoshis
    public func buildTransaction(feePerByte: UInt64) throws -> T {
        
        let expectedFeeValue = try calculator.calculate(with: feePerByte)
        
        let usedInputs = calculator.usedInputs.map({
            BitcoinTransactionInput(hash: $0.transactionHash,
                                    id: Data($0.transactionHash.reversed()).hex,
                                    index: Int($0.outputN),
                                    value: UInt64($0.value),
                                    script: $0.script)
        })
        
        let inputsAmount = usedInputs.map({ $0.value }).reduce(0, +)

        
        var usedOutputs: [BitcoinTransactionOutput] = []
        
        let outputAddress = try BitcoinPublicKeyAddress(string: params.to, version: utilAddressVersion)
        let output = BitcoinTransactionOutput(amount: params.amount, address: outputAddress)
        
        usedOutputs.append(output)
        
        if !params.isSendAll && !params.change.isEmpty {
            
            let outputChangeAddress = try BitcoinPublicKeyAddress(string: params.change, version: utilAddressVersion)
            
            let changeOutput = BitcoinTransactionOutput(amount: inputsAmount - (params.amount + expectedFeeValue), address: outputChangeAddress)
            
            usedOutputs.append(changeOutput)
            
        }
        
        return T(inputs: usedInputs, outputs: usedOutputs, settings: settings)
    }
    
    
    /// Transaction creation
    /// - Parameter feeAmount: The commission value for the transaction which will be set without calculation in accordance with its size
    public func buildTransaction(feeAmount: UInt64) throws -> T {
        
        let dust: UInt64 = params.isSendAll ? 0 : params.dust
         
        let unspentSorted = params.utxo.sorted(by: { $0.value > $1.value })
        var usedInputs: [BitcoinTransactionInput] = []
         
        var total: UInt64 = 0
         
        for txinput in unspentSorted {
            
            if settings.allowedScriptTypes.contains(txinput.script.type) {
                
                let input = BitcoinTransactionInput(hash: txinput.transactionHash,
                                                    id: Data(txinput.transactionHash.reversed()).hex,
                                                    index: Int(txinput.outputN),
                                                    value: UInt64(txinput.value),
                                                    script: txinput.script)
                
                usedInputs.append(input)
                total += txinput.value
                
            }
            
            if total > params.amount + dust { break }
        }
         
        var usedOutputs: [BitcoinTransactionOutput] = []
         
        let outputAddress = try BitcoinPublicKeyAddress(string: params.to, version: utilAddressVersion)
        let output = BitcoinTransactionOutput(amount: params.amount, address: outputAddress)
        
        usedOutputs.append(output)
        
        if !params.isSendAll && !params.change.isEmpty {
            
            let outputChangeAddress = try BitcoinPublicKeyAddress(string: params.change, version: utilAddressVersion)
            
            let changeOutput = BitcoinTransactionOutput(amount: UInt64(total) - (params.amount + feeAmount), address: outputChangeAddress)
            
            usedOutputs.append(changeOutput)
            
        }
         
        return T(inputs: usedInputs, outputs: usedOutputs, settings: settings)
    }
}
