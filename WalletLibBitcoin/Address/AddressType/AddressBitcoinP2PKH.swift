//
//  AddressBitcoinP2PKH.swift
//  WalletLibBitcoin
//
//

import Foundation
import WalletLibAddressBech32


public struct AddressBitcoinP2PKH: AddressScriptHashTypeProtocol {
    
    
    public var version: UInt8 { BitcoinVersionByteConstant.p2pkh }
    
    
    public var value: BitcoinAddressHashType { .P2PKH }
    
    
    public var hrp: AddressHRP {
        
        AddressHRP(prefix: "", separator: "")
        
    }
    
    
    public init() {}
    
    
}
