//
//  BitcoinTransactionSettings.swift
//  WalletLibBitcoin
//
//

import Foundation
import WalletLibBitcoinScript


/// An object containing the settings of the transaction fields, such as version, locktime, witness marker, flag, as well as a set of used script types
public class BitcoinTransactionSettings {
    
    
    public var version: UInt32 = 1
    
    
    public var witness: (marker: UInt8, flag: UInt8)?
    
    
    public var allowedScriptTypes: [BitcoinScript.ScriptType] = [.P2PKH]
    
    
    public var signatureHashType: SignatureHashType = SignatureHashType(btc: .sighashAll)
    
    
    public var lockTime: UInt32 = 0
    
    
    public init() {}
    
    
    @discardableResult
    public func version(_ int: UInt32) -> BitcoinTransactionSettings {
    
        version = int
        
        return self
    }
    
    
    @discardableResult
    public func witness(marker: UInt8, flag: UInt8) -> BitcoinTransactionSettings {
    
        witness = (marker: marker, flag: flag)
        
        return self
    }
    
    
    @discardableResult
    public func allowed(scriptTypes: [BitcoinScript.ScriptType]) -> BitcoinTransactionSettings {
    
        allowedScriptTypes = scriptTypes
        
        return self
    }
    
    
    @discardableResult
    public func signatureHashType(type: SignatureHashType) -> BitcoinTransactionSettings {
    
        signatureHashType = type
        
        return self
    }
    
    
    @discardableResult
    public func lockTime(_ uint32: UInt32) -> BitcoinTransactionSettings {
    
        lockTime = uint32
        
        return self
    }
    
    
    public class var new: BitcoinTransactionSettings {
    
        BitcoinTransactionSettings()
    }
    
    
    public class var bitcoinDefaults: BitcoinTransactionSettings {
    
        BitcoinTransactionSettings()
    }
    
    
    public class var bitcoinWitnessDefaults: BitcoinTransactionSettings {
    
        BitcoinTransactionSettings()
            .witness(marker: 0, flag: 1)
            .allowed(scriptTypes: [.P2PKH, .P2SH, .P2WPKH])
            .signatureHashType(type: SignatureHashType(btc: .sighashAll))
    }
    
    
    public var isWitness: Bool {
        
        guard let (marker, flag) = witness, marker == 0x00, flag == 0x01 else {
            
            return false
            
        }
        
        return true
    }
    
    
}
