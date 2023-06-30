//
//  AddressBitcoinP2WSH.swift
//  WalletLibBitcoin
//
//

import Foundation
import WalletLibAddressBech32


public struct AddressBitcoinP2WSH: AddressScriptHashTypeProtocol {
    
    
    public var version: UInt8 { BitcoinVersionByteConstant.p2wsh }
    
    
    public var value: BitcoinAddressHashType { .P2WSH }
    
    
    public var hrp: AddressHRP {
        
        AddressHRP(prefix: "bc", separator: "1")
        
    }
    
    
    public init() {}
    
    
}
