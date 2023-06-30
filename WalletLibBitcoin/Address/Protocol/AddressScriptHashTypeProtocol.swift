//
//  AddressScriptHashTypeProtocol.swift
//  WalletLibBitcoin
//
//

import Foundation
import WalletLibBitcoinScript
import WalletLibAddressBech32


public protocol AddressScriptHashTypeProtocol {
    
    
    var version: UInt8 { get }
    
    
    var value: BitcoinAddressHashType { get }
    
    
    var hrp: AddressHRP { get }
    
    
}
