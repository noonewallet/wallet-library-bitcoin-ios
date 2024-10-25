//
//  BitcoinPrivateKeyAddress.swift
//  WalletLibBitcoin
//
//

import Foundation
import WalletLibCrypto.KeySecp256k1


/// Bitcoin private key address
public class BitcoinPrivateKeyAddress {
    
    
    public let wif: String
    
    
    public let data: Data
    
    
    /// Initialize with a private key data
    /// - Parameter privateKeyData: Private key data (should be 32 bytes long)
    /// - Parameter version: Version byte
    /// - Throws: BitcoinCreateAddressError.invalidDataLength
    public init(privateKeyData: Data, version: UInt8 = BitcoinVersionByteConstant.private_key) throws {
       
        guard privateKeyData.count == BitcoinAddressConstants.privateKeyDataLength else {
            
            throw BitcoinCreateAddressError.invalidDataLength
            
        }
        
        data = privateKeyData
        
        let s3 = Data([version] + [UInt8](privateKeyData) + [0x01])
        wif = s3.base58(usingChecksum: true)
    }
    
    
    /// Initialize with a Key object
    /// - Parameter key: Key of private type
    /// - Parameter version: Version byte
    /// - Throws: BitcoinCreateAddressError.invalidKeyType
    public init(key: KeySecp256k1, version: UInt8 = BitcoinVersionByteConstant.private_key) throws {
        
        guard key.type == .Private else {
            
            throw BitcoinCreateAddressError.invalidKeyType
            
        }

        data = key.data
        
        let s3 = Data([version] + [UInt8](key.data) + [0x01])
        wif = s3.base58(usingChecksum: true)
    }
    
    
    /// Initialize with a WIF string
    /// - Parameter wif: WIF string
    /// - Throws: BitcoinCreateAddressError.invalidWIFAddressLength, BitcoinCreateAddressError.invalidDataLength, BitcoinCreateAddressError.invalidWIFAddressVersion
    public init(wif: String) throws {
        
        let wifDecoded = wif.base58decode(usingChecksum: true)
        
        guard wifDecoded.count > 3 else {
            
            throw BitcoinCreateAddressError.invalidWIFAddressLength
            
        }
        
        var privateKeyData = wifDecoded.subdata(in: 1..<(wifDecoded.count - 1))
        
        var wif = wif
        if wifDecoded.count == 33 {
            privateKeyData.append(0x01)
            var compressedPrivateKey = Data([0x80]) + privateKeyData
            let checksum = compressedPrivateKey.sha256sha256().prefix(4)
            compressedPrivateKey.append(contentsOf: checksum)
            wif = compressedPrivateKey.base58(usingChecksum: true)
        }
        
        let privateKeyDataLength = privateKeyData.count
        
        guard privateKeyDataLength == BitcoinAddressConstants.privateKeyDataLength else {
            
            throw BitcoinCreateAddressError.invalidDataLength
            
        }
        
        let versionByte = wifDecoded[0]
        
        guard versionByte == BitcoinVersionByteConstant.private_key else {
            
            throw BitcoinCreateAddressError.invalidWIFAddressVersion
            
        }
        
        self.wif = wif
        data = privateKeyData
    }
    
}
