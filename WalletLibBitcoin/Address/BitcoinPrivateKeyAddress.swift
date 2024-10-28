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
        
        let s3 = Data([version] + [UInt8](privateKeyData) + [BitcoinAddressConstants.compressionFlag])
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
        
        let s3 = Data([version] + [UInt8](key.data) + [BitcoinAddressConstants.compressionFlag])
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
        
        guard let versionByte = wifDecoded.first,
              versionByte == BitcoinVersionByteConstant.private_key
        else {
            throw BitcoinCreateAddressError.invalidWIFAddressVersion
        }
        
        var privateKeyData = wifDecoded.dropFirst()
        let isCompressed = privateKeyData.count == BitcoinAddressConstants.privateKeyDataLength + 1
            && wifDecoded.last == BitcoinAddressConstants.compressionFlag
        
        if isCompressed {
            privateKeyData.removeLast()
        }
        
        let privateKeyDataLength = privateKeyData.count
        guard privateKeyDataLength == BitcoinAddressConstants.privateKeyDataLength else {
            throw BitcoinCreateAddressError.invalidDataLength
        }
        
        var wif = wif
        if !isCompressed {
            var compressedPrivateKey = Data([versionByte]) + privateKeyData + Data([BitcoinAddressConstants.compressionFlag])
            let checksum = compressedPrivateKey.sha256sha256().prefix(4)
            compressedPrivateKey.append(contentsOf: checksum)
            wif = compressedPrivateKey.base58(usingChecksum: true)
        }
        
        self.wif = wif
        self.data = privateKeyData
    }
    
}
