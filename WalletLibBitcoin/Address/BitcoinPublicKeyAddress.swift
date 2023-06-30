//
//  BitcoinPublicKeyAddress.swift
//  WalletLibBitcoin
//
//

import Foundation
import WalletLibCrypto
import WalletLibBitcoinScript
import WalletLibAddressBech32


/// Bitcoin public key address
public class BitcoinPublicKeyAddress {
    
    
    /// Public key hash or script hash data
    let _data: Data
    
    
    public let hashType: AddressScriptHashTypeProtocol
    
    
    public let address: String
    
    
    /// Initialize with a public key data
    /// - Parameter publicKey: Public key data (should  be 33 bytes long (compressed public key))
    /// - Parameter type: Hash type of a public key address P2PKH, P2SH
    /// - Throws: BitcoinCreateAddressError.invalidDataLength
    public init(publicKey: Data, type: AddressScriptHashTypeProtocol) throws {
        
        guard publicKey.count == BitcoinAddressConstants.publicKeyDataLength else {
        
            throw BitcoinCreateAddressError.invalidDataLength
            
        }
        
        let payload = BitcoinPublicKeyAddress.payload(for: publicKey, type: type)
        let encoded = BitcoinPublicKeyAddress.encode(payload, for: type)

        _data = payload
        hashType = type
        
        address = encoded
    }
    
    
    /// Initialize with a Key object
    /// - Parameter key: Key of public or private type
    /// - Throws: BitcoinCreateAddressError.invalidKeyType, BitcoinCreateAddressError.invalidDataLength,
    public init(key: KeySecp256k1, type: AddressScriptHashTypeProtocol) throws {
        
        var publicKey: Data?
        
        switch key.type {
        case .Private:
            
            publicKey = key.publicKeyCompressed(.CompressedConversion)
            
        case .Public:
            
            publicKey = key.data
            
        @unknown default:
            
            publicKey = nil
            
        }
        
        guard let data = publicKey else {
            
            throw BitcoinCreateAddressError.invalidKeyType
            
        }
        
        guard data.count == BitcoinAddressConstants.publicKeyDataLength else {
            
            throw BitcoinCreateAddressError.invalidDataLength
            
        }
        
        let payload = BitcoinPublicKeyAddress.payload(for: data, type: type)
        let encoded = BitcoinPublicKeyAddress.encode(payload, for: type)
        
        _data = payload
        hashType = type
        
        address = encoded
    }
    
    
    /// Initialize with a script
    /// - Parameter script: Script
    /// - Parameter type: Address hash type
    /// - Throws: BitcoinCreateAddressError.invalidAddressVersion, BitcoinCreateAddressError.invalidDataLength
    convenience public init(script: BitcoinScript, type: AddressScriptHashTypeProtocol, version util: AddressVersionUtilProtocol) throws {
        
        switch script.type {
        case .P2PKH:
            
            try self.init(data: type.version.data + script.getPublicKeyHash(), version: util)
            
        case .P2SH:
            
            try self.init(data: type.version.data + script.getPublicKeyHash(), version: util)
            
        case .P2WPKH:
            
            try self.init(data: script.getPublicKeyHash(), type: type, version: util)
            
        case .P2WSH:
            
            try self.init(data: script.getPublicKeyHash(), type: type, version: util)
            
        default:
            
            throw BitcoinCreateAddressError.invalidAddressVersion
            
        }
    }
    
    
    /// Initialize with a public key hash or a script hash data (with version byte in prefix)
    /// - Parameter data: Public key hash or script hash data (with version byte in prefix)
    /// - Parameter type: Required and used only to define the representation of the witness address
    /// - Throws: BitcoinCreateAddressError.invalidDataLength, BitcoinCreateAddressError.invalidAddressVersion
    public init(data: Data, type: AddressScriptHashTypeProtocol? = nil, version util: AddressVersionUtilProtocol) throws {
        
        _data = data
        
        if data.count == 21 && util.validate(version: data[0]) {
            
            if let type = util.generate(version: data[0]) {
                
                hashType = type
                
            } else {
                
                throw BitcoinCreateAddressError.invalidDataLength
                
            }
            
        }  else {
            
            guard let targetType = type else {
                
                throw BitcoinCreateAddressError.invalidAddressVersion
                
            }
            
            switch data.count {
            case BitcoinAddressConstants.witnessProgramWPKHLength:
                
                guard targetType.value == .P2WPKH else {
                    
                    throw BitcoinCreateAddressError.invalidAddressVersion
                    
                }
                
                hashType = targetType
                
            case BitcoinAddressConstants.witnessProgramWSHLength:
                
                guard targetType.value == .P2WSH else {
                    
                    throw BitcoinCreateAddressError.invalidAddressVersion
                    
                }
                
                hashType = targetType
                
            default:
                
                throw BitcoinCreateAddressError.invalidDataLength
                
            }
            
        }
        
        address = BitcoinPublicKeyAddress.encode(data, for: hashType)
    }
    
    
    /// Initialize with a string
    /// - Parameter string: Bech32 or Base58  address string
    /// - Throws: BitcoinCreateAddressError.invalidDataLength, BitcoinCreateAddressError.invalidAddressVersion
    convenience public init(string: String, version util: AddressVersionUtilProtocol) throws {
        
        if let type = util.allTypes.first(where: { !$0.hrp.description.isEmpty && string.hasPrefix($0.hrp.description) }) {
            
            try self.init(bech32: string, type: type)
            
        } else {
            
            try self.init(base58: string, version: util)
            
        }
    }
    
    
    /// Initialize with a base58 representation of legacy or script hash bitcoin address
    /// - Parameter base58: Legacy or script hash bitcoin address string
    /// - Throws: BitcoinCreateAddressError.invalidDataLength, BitcoinCreateAddressError.invalidDataLength
    public init(base58: String, version util: AddressVersionUtilProtocol) throws {
        
        _data = base58.base58decode(usingChecksum: true)
        
        let dataLength = _data.count
        
        guard dataLength == BitcoinAddressConstants.publicKeyHashDataLength || dataLength == BitcoinAddressConstants.publicKeyScriptHashLength else {
            
            throw BitcoinCreateAddressError.invalidDataLength
            
        }
        
        let versionByte = _data[0]
        
        guard let type = util.generate(version: versionByte) else {
            
            throw BitcoinCreateAddressError.invalidAddressVersion
            
        }

        hashType = type
        address = base58
    }
    
    
    /// Initialize with a bech32  bitcoin address
    /// - Parameter bech32: Bech32 (witness representation) address string
    /// - Parameter type: Address hash type
    /// - Throws: BitcoinCreateAddressError.invalidDataLength
    public init(bech32: String, type: AddressScriptHashTypeProtocol) throws {
        
        _data = AddressCoderBech32.decode(witness: bech32, hrp: type.hrp, gen: AddressCoderBech32GeneratorBC1())

        switch _data.count {
        case BitcoinAddressConstants.witnessProgramWPKHLength:
            
            hashType = type
            
        case BitcoinAddressConstants.witnessProgramWSHLength:
            
            hashType = type
            
        default:
            
            throw BitcoinCreateAddressError.invalidHashDataLength
            
        }
        
        address = bech32
    }
    
    
    public static func p2pkh(from publicKey: Data) -> Data {
        
        publicKey.ripemd160sha256()
    }
    
    
    public static func p2sh(from publicKey: Data) -> Data {
        
        (Data([0x00, 0x14]) + publicKey.ripemd160sha256()).ripemd160sha256()
    }
    
    
    public static func p2wpkh(from publicKey: Data) -> Data {
        
        publicKey.ripemd160sha256()
    }
    
    
    public static func p2wsh(from publicKey: Data) -> Data {
        
        (Data([0x21]) + publicKey + OPCode.OP_CHECKSIG.value.data).sha256()
    }
    
    
    private static func payload(for publicKey: Data, type: AddressScriptHashTypeProtocol) -> Data {
        
        switch type.value {
        case .P2PKH:
            
            return type.version.data + p2pkh(from: publicKey)
            
        case .P2SH:
            
            return type.version.data + p2sh(from: publicKey)
            
        case .P2WPKH:
            
            return p2pkh(from: publicKey)
            
        case .P2WSH:
            
            return p2wsh(from: publicKey)
            
        }
    }
    
    
    private static func encode(_ payload: Data, for type: AddressScriptHashTypeProtocol) -> String {
        
        switch type.value {
        case .P2PKH, .P2SH:
            
            return payload.base58(usingChecksum: true)
            
        case .P2WPKH, .P2WSH:
            
            return type.hrp.description + AddressCoderBech32.encode(hrp: type.hrp.prefix,
                                                                    witnessVersion: BitcoinAddressConstants.witnessProgramVersionByte,
                                                                    witnessProgram: payload,
                                                                    gen: AddressCoderBech32GeneratorBC1())
            
        }
    }
    
    
    public func address(for type: AddressScriptHashTypeProtocol) -> String? {
        
        guard type.version != hashType.version else {
            
            return address
            
        }
        
        switch (hashType.value, type.value) {
        case (.P2PKH, .P2SH):
            
            return BitcoinPublicKeyAddress.encode(type.version.data + (Data([0x00, 0x14]) + _data.dropFirst()).ripemd160sha256(), for: type)
            
        case (.P2PKH, .P2WPKH):
            
            return BitcoinPublicKeyAddress.encode(_data.dropFirst(), for: type)
            
        case (.P2WPKH, .P2PKH):
            
            return BitcoinPublicKeyAddress.encode(type.version.data + _data, for: type)
            
        case (.P2WPKH, .P2SH):
            
            return BitcoinPublicKeyAddress.encode(type.version.data + (Data([0x00, 0x14]) + _data).ripemd160sha256(), for: type)
            
        case (.P2SH, .P2PKH), (.P2SH, .P2WPKH), (.P2SH, .P2WSH), (.P2WSH, .P2PKH), (.P2WSH, .P2WPKH), (.P2WSH, .P2SH):
            
            return nil
            
        default:
            
            return nil
            
        }
    }
    
    
    public var publicKeyHash: Data {
        
        switch hashType.value {
        case .P2PKH, .P2SH:
            
            return _data.dropFirst()
            
        case .P2WPKH, .P2WSH:
            
            return _data
            
        }
    }
    
    
}
