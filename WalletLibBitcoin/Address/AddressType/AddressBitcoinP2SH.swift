//
//  AddressBitcoinP2SH.swift
//  WalletLibBitcoin
//
//

import Foundation
import WalletLibAddressBech32


public struct AddressBitcoinP2SH: AddressScriptHashTypeProtocol {
    
    
    public var version: UInt8 { BitcoinVersionByteConstant.p2sh }
    
    
    public var value: BitcoinAddressHashType { .P2SH }
    
    
    public var hrp: AddressHRP {
        
        AddressHRP(prefix: "", separator: "")
        
    }
    
    
    public init() {}
    
    
}
