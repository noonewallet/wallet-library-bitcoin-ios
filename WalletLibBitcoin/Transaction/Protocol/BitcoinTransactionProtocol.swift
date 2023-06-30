//
//  BitcoinTransactionProtocol.swift
//  WalletLibBitcoin
//
//

import Foundation


public protocol BitcoinTransactionProtocol: AnyObject {
    
    
    var settings: BitcoinTransactionSettings { get }
    
    
    var version: UInt32 { get }
    
    
    var inputs: [BitcoinTransactionInput] { get }
    
    
    var outputs: [BitcoinTransactionOutput] { get }
    
    
    var lockTime: UInt32 { get }
    
    
    var id: String { get }
    
    
    var payload: Data { get }
    
    
    var transactionHash: Data { get }
    
    
    init(inputs: [BitcoinTransactionInput], outputs: [BitcoinTransactionOutput], settings: BitcoinTransactionSettings)
    
    
}
