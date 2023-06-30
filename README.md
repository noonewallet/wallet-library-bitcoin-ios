[![License](https://img.shields.io/badge/license-MIT-black.svg?style=flat)](https://mit-license.org)
[![Platform](https://img.shields.io/badge/platform-ios-blue.svg?style=flat)](https://developer.apple.com/resources/)
[![Swift](https://img.shields.io/badge/swift-5.0-brightgreen.svg)](https://developer.apple.com/resources/)
[![Version](https://img.shields.io/badge/Version-1.0-orange.svg)]()

![Noone core](https://github.com/noonewallet/noone-android-core-crypto/assets/111989613/1f062349-24d4-4824-9c00-b8f2724eca51)

## WalletLibBitcoin

The WalletLibBitcoin library is an implementation of tools related to Bitcoin blockchain.

## Requirements

* macOS 12.6
* XCode Version 14.2

## Installation

Using `CocoaPods`. 

Clone or download repo, add the following line to your `Podfile`

```ruby
# platform :ios, '10.0'

target 'YourTargetName' do
  use_frameworks!
  
  pod 'WalletLibBitcoin', :path => 'path/to/WalletLibBitcoin' 
end
```

## Usage

#### Calculating fee
```swift
            
    let utxo = [BitcoinUnspentOutput(address: "13T2yoS3jE2nd27cYA4EXcUhoTRMfxMHao", value: 16442, outputN: 0, scriptData: Data(hex: "76a9141adcb8050ca62a6132d4aface1fa86c56a36ed9f88ac"), hashData: Data(Data(hex: "e50dc7fa5cc1886be9e7121260fa2d859c31ae77391cc94db1a3e18bc746126a")))]
                
    let _ = utxo.map({ $0.value }).reduce(0, +)
            
    let calculator = FeeCalculator(amount: UInt64(330000), utxo: utxo, isSendAll: false)
            
    let sendAllCaluculator = FeeCalculator(amount: 0, utxo: utxo, isSendAll: true)    
    let sendAllInputsCount = utxo.count
            
    let sendAllTransactionSize = (148 * sendAllInputsCount) + (34 * 1) + 10

    do {
                
        let fee = try calculator.calculate(with: 20)                
        let sendAllFee = try sendAllCaluculator.calculate(with: 20)

    } catch let e {
                
        print("\(e)")
                
    }            

```

#### Creating and signing transaction

```swift

    let DEFAULT_SLIP0132: ([UInt8], [UInt8]) = ([0x04, 0x88, 0xB2, 0x1E], [0x04, 0x88, 0xAD, 0xE4])

    let utxo = [BitcoinUnspentOutput(address: "13T2yoS3jE2nd27cYA4EXcUhoTRMfxMHao", value: 16442, outputN: 0, scriptData: Data(hex: "76a9141adcb8050ca62a6132d4aface1fa86c56a36ed9f88ac"), hashData: Data(Data(hex: "e50dc7fa5cc1886be9e7121260fa2d859c31ae77391cc94db1a3e18bc746126a")))]
                
    let _ = utxo.map({ $0.value }).reduce(0, +)
     
    let params: BitcoinTransactionParameters = .new
                .amount(UInt64(330000))
                .to("18uiXzWF2ESqaUg5m4tHMnbSW1CNz1NDHQ")
                .change("1JTQLqq5qnsBkYf42yHTcP25VXQV21Euzb")
                .utxo(utxo)
                .sendAll(false)
            
    let util = BitcoinAddressVersionUtil()

    let builder = BitcoinTransactionBuilder<BitcoinTransaction>(params: params, settings: .bitcoinDefaults, util: util)

    guard let tx = try? builder.buildTransaction(feeAmount: UInt64(1870)) else {        
        print("Can't build transaction")
        return
    }

    let derivation = HDDerivation(seed: Data(hex: "bb0a3858dfbca088a736663740c7ff884a1a1d28f9efac125b79c9edf551577dc43da97676f0ccc58a82c63ca02d44fddc4b5d57a8302be256ebaa3e9bdfe4bb"), slip0132: DEFAULT_SLIP0132)
            
    try! derivation.derive(for: "m/44'/0'/0'/0")
            
    var keys: [KeySecp256k1] = []
            
    for i in 0..<50 {
        let k = derivation.deriveChild(for: UInt(i), hardened: false)            
        keys.append(k.key)        
    }
            
    derivation.reset()

    guard 

    try! derivation.derive(for: "m/44'/0'/0'/1")
            
    for i in 0..<50 {
        let k = derivation.deriveChild(for: UInt(i), hardened: false)
        keys.append(k.key)                
    }
            
    derivation.reset()

    guard let signedtx = try? tx.sign(keys: keys) else {
        print("Can't sign transaction")
        return
    }

```

## Created using
- [_WalletLibAddressBech32_](https://github.com/noonewallet/wallet-library-address-bech32-ios)
- [_WalletLibCrypto_](https://github.com/noonewallet/wallet-library-crypto-ios)
- [_WalletLibBitcoinScript_](https://github.com/noonewallet/wallet-library-bitcoin-script-ios)



## License

MIT. See the [_LICENSE_](LICENSE) file for more info.
