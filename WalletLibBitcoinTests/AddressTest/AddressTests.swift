//
//  AddressTests.swift
//  WalletLibBitcoinTests
//
//

import XCTest
@testable import WalletLibBitcoin
@testable import WalletLibCrypto


final class AddressTests: XCTestCase {
    
    private let DEFAULT_SLIP0132: ([UInt8], [UInt8]) = ([0x04, 0x88, 0xB2, 0x1E], [0x04, 0x88, 0xAD, 0xE4])

    func testWIFBitcoinAddresses() {
        
        //Mnemonic phrase: sure daring couple leisure want swear fluid border quality dwarf lake cat
        let derivation = HDDerivation(seed: Data(hex: "70a4bc60133ccc0aacbd9f194d4e495a47dfd5233a2be737afc4040d8bd3167cd8297c61e99a36d1d5763e14802b6b9c27052dca4c23fff961afa4c05ee1dc4c"), slip0132: DEFAULT_SLIP0132)
        
        try? derivation.derive(for: "m/44'/0'/0'/0")
        
        for i in 0..<30 {
            
            autoreleasepool(invoking: {
                
                let extkey = derivation.deriveChild(for: UInt(i), hardened: false)
                
                let privateAddressFromKey = try! BitcoinPrivateKeyAddress(key: extkey.key)
                
                let privateAddressFromData = try! BitcoinPrivateKeyAddress(privateKeyData: extkey.key.data)
                
                let publicAddressFromKey = try! BitcoinPublicKeyAddress(key: extkey.key, type: AddressBitcoinP2PKH())
                
                let publicAddressFromData = try! BitcoinPublicKeyAddress(publicKey: extkey.key.publicKeyCompressed(.CompressedConversion), type: AddressBitcoinP2PKH())
                
                let privateKeyFromWif = try! BitcoinPrivateKeyAddress(wif: BitcoinDerivationKeyAddressesTestVector.data[i].wif)

                XCTAssertFalse(privateAddressFromKey.wif != BitcoinDerivationKeyAddressesTestVector.data[i].wif, "Wrong wif address Expected:  \(BitcoinDerivationKeyAddressesTestVector.data[i].address) Result: \(privateAddressFromKey.wif )")
                
                XCTAssertFalse(privateAddressFromData.wif != BitcoinDerivationKeyAddressesTestVector.data[i].wif, "Wrong wif address Expected:  \(BitcoinDerivationKeyAddressesTestVector.data[i].address) Result: \(privateAddressFromKey.wif )")
                
                XCTAssertFalse(privateKeyFromWif.data.hex != extkey.key.data.hex, "Wrong private key data Expected:  \(extkey.key.data.hex) Result: \(privateKeyFromWif.data.hex )")
                
                XCTAssertFalse(publicAddressFromKey.address(for: AddressBitcoinP2PKH()) != BitcoinDerivationKeyAddressesTestVector.data[i].address, "Wrong leagacy public address Expected:  \(BitcoinDerivationKeyAddressesTestVector.data[i].address) Result: \(publicAddressFromKey.address )")
                
                XCTAssertFalse(publicAddressFromData.address(for: AddressBitcoinP2PKH()) != BitcoinDerivationKeyAddressesTestVector.data[i].address, "Wrong leagacy public address Expected:  \(BitcoinDerivationKeyAddressesTestVector.data[i].address) Result: \(publicAddressFromData.address)")
                
            })
            
        }
    }
    
    
    func testBitcoinAddresses() {
        for element in BitcoinAddressesTestVector.data {
            do {
                let key = Data(hex:element.key)
                let btcAddress = try BitcoinPublicKeyAddress(publicKey: key, type: AddressBitcoinP2PKH())
                
                XCTAssertFalse(btcAddress.address(for: AddressBitcoinP2PKH()) != element.address, "Wrong address Expected: \(element.address) Result: \(String(describing: btcAddress.address(for: AddressBitcoinP2PKH())))")
            } catch {
                XCTAssertFalse(false, "BitcoinPublicKeyAddress Error, Can't create from key: \(element.key)")
            }
        }
    }
    
    
    func testBitcoinSegwitAddress() {
        let publicKey = Data(hex: "0279BE667EF9DCBBAC55A06295CE870B07029BFCDB2DCE28D959F2815B16F81798")
        
        do {
            let addressP2WPKH = try BitcoinPublicKeyAddress(publicKey: publicKey, type: AddressBitcoinP2WPKH())
            let addressP2WSH = try BitcoinPublicKeyAddress(publicKey: publicKey, type: AddressBitcoinP2WSH())
            
            XCTAssertFalse(addressP2WPKH.address != "bc1qw508d6qejxtdg4y5r3zarvary0c5xw7kv8f3t4", "Wrong address Expected: bc1qw508d6qejxtdg4y5r3zarvary0c5xw7kv8f3t4 Result: \( addressP2WPKH.address)")
            
            XCTAssertFalse(addressP2WSH.address != "bc1qrp33g0q5c5txsp9arysrx4k6zdkfs4nce4xj0gdcccefvpysxf3qccfmv3", "Wrong address Expected: bc1qrp33g0q5c5txsp9arysrx4k6zdkfs4nce4xj0gdcccefvpysxf3qccfmv3 Result: \( addressP2WSH.address)")
            
        } catch {
            XCTAssertNotNil(error, "\(error)")
        }
    }
    
    
    func testBitcoinBIP84DerivationAddress() {
        
        //m/84'/0'/0'/0
        let derivation = HDDerivation(base58string: BitcoinSegwitDerivationTestVector.extendedPrivateKeyBIP84, type: .Private)
        let bip84ValidAddresses = BitcoinSegwitDerivationTestVector.validAddressesBIP84
        
        for i in 0..<bip84ValidAddresses.count {
            
            let key = derivation.deriveChild(for: UInt(i), hardened: false)
            
            do {
                
                let pubKeyAddress1 = try BitcoinPublicKeyAddress(key: key.key, type: AddressBitcoinP2WPKH())
                
                XCTAssertTrue(pubKeyAddress1.address(for: AddressBitcoinP2WPKH()) == bip84ValidAddresses[i], "Wrong address Expected: \(bip84ValidAddresses[i]) Result: \( String(describing: pubKeyAddress1.address(for: AddressBitcoinP2WPKH())))")
                
                let pubKeyAddress2 = try BitcoinPublicKeyAddress(key: key.key, type: AddressBitcoinP2PKH())
                
                XCTAssertTrue(pubKeyAddress2.address(for: AddressBitcoinP2WPKH()) == bip84ValidAddresses[i], "Wrong address Expected: \(bip84ValidAddresses[i]) Result: \( String(describing: pubKeyAddress2.address(for: AddressBitcoinP2WPKH())))")
                
                let pubKeyAddress3 = try BitcoinPublicKeyAddress(key: key.key, type: AddressBitcoinP2SH())
                
                XCTAssertTrue(pubKeyAddress3.address(for: AddressBitcoinP2WPKH()) == nil, "Wrong address Expected: Empty Result: \( String(describing: pubKeyAddress3.address(for: AddressBitcoinP2WPKH())))")
                
                let pubKeyAddress4 = try BitcoinPublicKeyAddress(key: key.key, type: AddressBitcoinP2WPKH())
                
                XCTAssertTrue(pubKeyAddress4.address == bip84ValidAddresses[i], "Wrong address Expected: \(bip84ValidAddresses[i]) Result: \( pubKeyAddress4.address)")
                
                XCTAssertTrue(pubKeyAddress4.address == bip84ValidAddresses[i], "Wrong address Expected: \(bip84ValidAddresses[i]) Result: \( pubKeyAddress4.address)")
                
                let pubKeyAddress5 = try BitcoinPublicKeyAddress(key: key.key, type: AddressBitcoinP2WSH())
                
                XCTAssertTrue(pubKeyAddress5.address(for: AddressBitcoinP2WPKH()) == nil, "Wrong address Expected: Empty Result: \( String(describing: pubKeyAddress5.address(for: AddressBitcoinP2WPKH())))")
                
                let pubKeyAddress6 = try BitcoinPublicKeyAddress(publicKey: key.key.publicKeyCompressed(.CompressedConversion), type: AddressBitcoinP2PKH())
                
                XCTAssertTrue(pubKeyAddress6.address(for: AddressBitcoinP2WPKH()) == bip84ValidAddresses[i], "Wrong address Expected: \(bip84ValidAddresses[i]) Result: \( String(describing: pubKeyAddress6.address(for: AddressBitcoinP2WPKH())))")
                
                let pubKeyAddress7 = try BitcoinPublicKeyAddress(publicKey: key.key.publicKeyCompressed(.CompressedConversion), type: AddressBitcoinP2PKH())
                
                XCTAssertTrue(pubKeyAddress7.address(for: AddressBitcoinP2WPKH()) == bip84ValidAddresses[i], "Wrong address Expected: \(bip84ValidAddresses[i]) Result: \( String(describing: pubKeyAddress7.address(for: AddressBitcoinP2WPKH())))")
                
                let pubKeyAddress8 = try BitcoinPublicKeyAddress(publicKey: key.key.publicKeyCompressed(.CompressedConversion), type: AddressBitcoinP2SH())
                
                XCTAssertTrue(pubKeyAddress8.address(for: AddressBitcoinP2WPKH()) == nil, "Wrong address Expected: Empty Result: \( String(describing: pubKeyAddress8.address(for: AddressBitcoinP2WPKH())))")
                
                let pubKeyAddress9 = try BitcoinPublicKeyAddress(publicKey: key.key.publicKeyCompressed(.CompressedConversion), type: AddressBitcoinP2WPKH())
                
                XCTAssertTrue(pubKeyAddress9.address == bip84ValidAddresses[i], "Wrong address Expected: \(bip84ValidAddresses[i]) Result: \( pubKeyAddress9.address)")
                
                XCTAssertTrue(pubKeyAddress9.address(for: AddressBitcoinP2WPKH()) == bip84ValidAddresses[i], "Wrong address Expected: \(bip84ValidAddresses[i]) Result: \( String(describing: pubKeyAddress9.address(for: AddressBitcoinP2WPKH())))")
                
                let pubKeyAddress10 = try BitcoinPublicKeyAddress(publicKey: key.key.publicKeyCompressed(.CompressedConversion), type: AddressBitcoinP2WSH())
                
                XCTAssertTrue(pubKeyAddress10.address(for: AddressBitcoinP2WPKH()) == nil, "Wrong address Expected: Empty Result: \( String(describing: pubKeyAddress10.address(for: AddressBitcoinP2WPKH())))")
                
            } catch {
                
                XCTAssertNotNil(error, "\(error)")
                
            }
            
        }
    }
    
    
    func testBitcoinBIP49DerivationAddress() {
        
        //m/49'/0'/0'/0
        let derivation = HDDerivation(base58string: BitcoinSegwitDerivationTestVector.extendedPrivateKeyBIP49, type: .Private)
        let bip49ValidAddresses = BitcoinSegwitDerivationTestVector.validAddressesBIP49
        
        for i in 0..<bip49ValidAddresses.count {
            
            let key = derivation.deriveChild(for: UInt(i), hardened: false)
            
            do {
                
                let privateKey = key.key
                let publicKey = key.key.publicKeyCompressed(.CompressedConversion)
                
                let pubKeyAddress1 = try BitcoinPublicKeyAddress(key: privateKey, type: AddressBitcoinP2PKH())
                
                XCTAssertTrue(pubKeyAddress1.address(for: AddressBitcoinP2SH()) == bip49ValidAddresses[i], "Wrong address Expected: \(bip49ValidAddresses[i]) Result: \( String(describing: pubKeyAddress1.address(for: AddressBitcoinP2SH())))")
                
                let pubKeyAddress2 = try BitcoinPublicKeyAddress(key: privateKey, type: AddressBitcoinP2PKH())
                
                XCTAssertTrue(pubKeyAddress2.address(for: AddressBitcoinP2SH()) == bip49ValidAddresses[i], "Wrong address Expected: \(bip49ValidAddresses[i]) Result: \( String(describing: pubKeyAddress2.address(for: AddressBitcoinP2SH())))")
                
                let pubKeyAddress3 = try BitcoinPublicKeyAddress(key: privateKey, type: AddressBitcoinP2SH())
                
                XCTAssertTrue(pubKeyAddress3.address == bip49ValidAddresses[i], "Wrong address Expected: \(bip49ValidAddresses[i]) Result: \( pubKeyAddress3.address)")
                
                XCTAssertTrue(pubKeyAddress3.address(for: AddressBitcoinP2SH()) == bip49ValidAddresses[i], "Wrong address Expected: \(bip49ValidAddresses[i]) Result: \( String(describing: pubKeyAddress3.address(for: AddressBitcoinP2SH())))")
                
                let pubKeyAddress4 = try BitcoinPublicKeyAddress(key: privateKey, type: AddressBitcoinP2WPKH())
                
                XCTAssertTrue(pubKeyAddress4.address(for: AddressBitcoinP2SH()) == bip49ValidAddresses[i], "Wrong address Expected: \(bip49ValidAddresses[i]) Result: \( String(describing: pubKeyAddress4.address(for: AddressBitcoinP2SH())))")
                
                let pubKeyAddress5 = try BitcoinPublicKeyAddress(key: privateKey, type: AddressBitcoinP2WSH())
                
                XCTAssertTrue(pubKeyAddress5.address(for: AddressBitcoinP2SH()) == nil, "Wrong address Expected: Empty Result: \( String(describing: pubKeyAddress5.address(for: AddressBitcoinP2SH())))")
                
                let pubKeyAddress6 = try BitcoinPublicKeyAddress(publicKey: publicKey, type: AddressBitcoinP2PKH())
                
                XCTAssertTrue(pubKeyAddress6.address(for: AddressBitcoinP2SH()) == bip49ValidAddresses[i], "Wrong address Expected: \(bip49ValidAddresses[i]) Result: \( String(describing: pubKeyAddress6.address(for: AddressBitcoinP2SH())))")
                
                let pubKeyAddress7 = try BitcoinPublicKeyAddress(publicKey: publicKey, type: AddressBitcoinP2PKH())
                
                XCTAssertTrue(pubKeyAddress7.address(for: AddressBitcoinP2SH()) == bip49ValidAddresses[i], "Wrong address Expected: \(bip49ValidAddresses[i]) Result: \( String(describing: pubKeyAddress7.address(for: AddressBitcoinP2SH())))")
                
                let pubKeyAddress8 = try BitcoinPublicKeyAddress(publicKey: publicKey, type: AddressBitcoinP2SH())
                
                XCTAssertTrue(pubKeyAddress8.address == bip49ValidAddresses[i], "Wrong address Expected: Empty Result: \( pubKeyAddress8.address)")
                
                XCTAssertTrue(pubKeyAddress8.address(for: AddressBitcoinP2SH()) == bip49ValidAddresses[i], "Wrong address Expected: \(bip49ValidAddresses[i]) Result: \( String(describing: pubKeyAddress8.address(for: AddressBitcoinP2SH())))")
                
                let pubKeyAddress9 = try BitcoinPublicKeyAddress(publicKey: publicKey, type: AddressBitcoinP2WPKH())
                
                XCTAssertTrue(pubKeyAddress9.address(for: AddressBitcoinP2SH()) == bip49ValidAddresses[i], "Wrong address Expected: \(bip49ValidAddresses[i]) Result: \( String(describing: pubKeyAddress9.address(for: AddressBitcoinP2SH())))")
                
                let pubKeyAddress10 = try BitcoinPublicKeyAddress(publicKey: publicKey, type: AddressBitcoinP2WSH())
                
                XCTAssertTrue(pubKeyAddress10.address(for: AddressBitcoinP2SH()) == nil, "Wrong address Expected: Empty Result: \( String(describing: pubKeyAddress10.address(for: AddressBitcoinP2SH())))")
                
            } catch {
                
                XCTAssertNotNil(error, "\(error)")
                
            }
            
        }
        
    }

}
