//
//  AddressBitcoinP2WPKH.swift
//  WalletLibBitcoin
//
//

import Foundation
import WalletLibAddressBech32


public struct AddressBitcoinP2WPKH: AddressScriptHashTypeProtocol {
    
    
    public var version: UInt8 { BitcoinVersionByteConstant.p2wpkh }
    
    
    public var value: BitcoinAddressHashType { .P2WPKH }
    
    
    public var hrp: AddressHRP {
        
        AddressHRP(prefix: "bc", separator: "1")
        
    }
    
    
    public init() {}
    
    
}
