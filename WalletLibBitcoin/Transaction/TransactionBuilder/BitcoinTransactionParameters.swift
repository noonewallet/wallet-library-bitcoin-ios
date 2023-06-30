//
//  BitcoinTransactionParameters.swift
//  WalletLibBitcoin
//
//

import Foundation


public class BitcoinTransactionParameters {
    
    
    public var to: String
    
    
    public var change: String
    
    
    public var utxo: [BitcoinUnspentOutput]
    
    
    public var amount: UInt64
    
    
    public var dust: UInt64
    
    
    public var isSendAll: Bool
    
    
    class var new: BitcoinTransactionParameters {
        
        BitcoinTransactionParameters()
    }
    
    
    public init() {
        
        to = ""
        
        change = ""
        
        utxo = []
        
        amount = 0
        
        dust = 1000
        
        isSendAll = false
        
    }
    
    
    public func to(_ address: String) -> Self {
        
        to = address
        
        return self
    }
    
    
    public func change(_ address: String) -> Self {
        
        change = address
        
        return self
    }
    
    
    public func utxo(_ list: [BitcoinUnspentOutput]) -> Self {
        
        utxo = list
        
        return self
    }
    
    
    public func amount(_ uint64: UInt64) -> Self {
        
        amount = uint64
        
        return self
    }
    
    
    public func dust(_ uint64: UInt64) -> Self {
        
        dust = uint64
        
        return self
    }
    
    
    public func sendAll(_ bool: Bool) -> Self {
        
        isSendAll = bool
        
        return self
    }
    
    
}
