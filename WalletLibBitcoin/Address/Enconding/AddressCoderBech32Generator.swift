//
//  AddressCoderBech32Generator.swift
//  WalletLibBitcoin
//
//

import Foundation
import WalletLibAddressBech32


public struct AddressCoderBech32GeneratorBC1: AddressCoderBech32GeneratorProtocol {
    
    public var value: [UInt64] {
        
        [0x3b6a57b2, 0x26508e6d, 0x1ea119fa, 0x3d4233dd, 0x2a1462b3]
    }
    
    public var shift: UInt64 {
        
        25
    }
    
    public var mask: UInt64 {

        0x1ffffff
    }
    
}
