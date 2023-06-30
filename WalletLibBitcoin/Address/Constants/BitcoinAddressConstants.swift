//
//  BitcoinAddressConstants.swift
//  WalletLibBitcoin
//
//

import Foundation


/// Contains constants for work with BitcoinPublicKeyAddress, BitcoinPrivateKeyAddress
/// - publicKeyAddressVersion: 0
/// - publicKeyDataLength: 33
/// - publicKeyHashDataLength: 21
/// - publicKeyScriptHashLength: 21
/// - privateKeyAddressVersion: 128
/// - privateKeyDataLength: 32
public struct BitcoinAddressConstants {
    
    
    //BIP-141 Defined witness program version
    public static let witnessProgramVersionByte: UInt8 = 0x00
    
    
    public static let witnessProgramWPKHLength = 20
    
    
    public static let witnessProgramWSHLength = 32
    
    
    public static let privateKeyDataLength = 32
    
    
    public static let publicKeyDataLength = 33
    
    
    public static let publicKeyHashDataLength = 21
    
    
    public static let publicKeyScriptHashLength = 21
    
    
}




public struct BitcoinVersionByteConstant {
    
    
    public static let p2pkh: UInt8 = 0x00
    
    
    public static let p2sh: UInt8 = 0x05
    
    
    public static let p2wpkh: UInt8 = 0x06
    
    
    public static let p2wsh: UInt8 = 0x0A
    
    
    public static let private_key: UInt8 = 0x80
    
    
}
