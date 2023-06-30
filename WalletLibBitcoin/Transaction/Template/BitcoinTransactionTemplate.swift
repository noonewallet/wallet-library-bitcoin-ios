//
//  BitcoinTransactionTemplate.swift
//  WalletLibBitcoin
//
//

import Foundation


/// Basic class for the bitcoin similar transactions
open class BitcoinTemplateTransaction {
    
    
    public var settings: BitcoinTransactionSettings
    
    
    public let inputs: [BitcoinTransactionInput]
    
    
    public let outputs: [BitcoinTransactionOutput]
    
    
    public var version: UInt32 {
    
        settings.version
    }
    
    
    public var lockTime: UInt32 {
    
        settings.lockTime
    }
    
    
    public var payload: Data {
    
        let serializer = BitcoinTransactionSerializer()
        
        var result = serializer.serialize(version)
        result += serializer.serialize(inputs)
        result += serializer.serialize(outputs)
        result += serializer.serialize(lockTime)
        
        return result
    }
    
    
    /// Init
    /// - Parameter inputs: Set of inputs
    /// - Parameter outputs: Set of outputs
    public required init(inputs: [BitcoinTransactionInput], outputs: [BitcoinTransactionOutput]) {
    
        self.settings = BitcoinTransactionSettings.bitcoinDefaults
        
        self.inputs = inputs
        self.outputs = outputs
    }
    
    
    /// Init
    /// - Parameter inputs: Set of inputs
    /// - Parameter outputs: Set of outputs
    /// - Parameter settings: Transaction build settings
    required public init(inputs: [BitcoinTransactionInput], outputs: [BitcoinTransactionOutput], settings: BitcoinTransactionSettings) {
    
        self.settings = settings
        
        self.inputs = inputs
        self.outputs = outputs
    }
    
    
}
