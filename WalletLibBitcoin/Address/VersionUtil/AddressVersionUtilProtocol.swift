//
//  AddressVersionUtilProtocol.swift
//  WalletLibBitcoin
//
//

import Foundation

public protocol AddressVersionUtilProtocol {
    
    
    var allTypes: [AddressScriptHashTypeProtocol] { get }
    
    
    func validate(version: UInt8) -> Bool
    
    
    func generate(version: UInt8) -> AddressScriptHashTypeProtocol?
    
    
}
