//
//  BitcoinAddressVersionUtil.swift
//  WalletLibBitcoin
//
//

import Foundation


public struct BitcoinAddressVersionUtil: AddressVersionUtilProtocol {
    
    
    public init() {}
    
    
    public func validate(version: UInt8) -> Bool {
        
        Set(
            [
                BitcoinVersionByteConstant.p2pkh,
                BitcoinVersionByteConstant.p2sh,
                BitcoinVersionByteConstant.p2wpkh,
                BitcoinVersionByteConstant.p2wsh
            ]
        ).contains(version)
    }
    
    
    public func generate(version: UInt8) -> AddressScriptHashTypeProtocol? {
        
        switch version {
        case BitcoinVersionByteConstant.p2pkh:
            
            return AddressBitcoinP2PKH()
            
        case BitcoinVersionByteConstant.p2sh:
            
            return AddressBitcoinP2SH()
            
        default:
            
            return nil
            
        }
    }
    
    
    public var allTypes: [AddressScriptHashTypeProtocol] {
        
        [
            AddressBitcoinP2WPKH(),
            AddressBitcoinP2WSH(),
            AddressBitcoinP2PKH(),
            AddressBitcoinP2SH()
        ]
    }
    
    
}
