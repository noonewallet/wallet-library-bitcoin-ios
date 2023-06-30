//
//  SignatureHashType.swift
//  WalletLibBitcoin
//
//

import Foundation


public struct SignatureHashType {
    
    
    private static let _sighashAll: UInt8 = 0x01
    
    
    private static let _sighashNone: UInt8 = 0x02
    
    
    private static let _sighashSingle: UInt8 = 0x03
    
    
    private static let _sighashAnyOneCanPay: UInt8 = 0x80
    
    
    private static let _sighashOutputMask: UInt8 = 0x1f
    
    
    public enum Bitcoin: UInt8 {
        
        
        case sighashAll = 0x01
        
        
        case sighashNone = 0x02
        
        
        case sighashSingle = 0x03
        
        
        case sighashAnyOneCanPay = 0x80
        
        
    }
    
    
    public let value: UInt8
    
    
    public let forkID: UInt8
    
    
    public init(btc: SignatureHashType.Bitcoin, fork id: UInt8 = 0) {
    
        value = btc.rawValue | id
        forkID = id
    }
    
    
    public var outputType: UInt8 {
    
        value & SignatureHashType._sighashOutputMask
    }
    
    
    public var isAll: Bool {
    
        outputType == SignatureHashType._sighashAll
    }
    
    
    public var isSingle: Bool {
    
        outputType == SignatureHashType._sighashSingle
    }
    
    
    public var isNone: Bool {
    
        outputType == SignatureHashType._sighashNone
    }
    
    
    public var isForkId: Bool {
    
        (value & forkID) != 0
    }
    
    
    public var isAnyOneCanPay: Bool {
    
        (value & SignatureHashType._sighashAnyOneCanPay) != 0
    }
    
    
}
