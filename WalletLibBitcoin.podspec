#
#  Be sure to run `pod spec lint WalletLibBitcoin.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "WalletLibBitcoin"
  s.version      = "1.0"
  s.summary      = "WalletLibBitcoin"
  s.homepage	 = "https://github.com/noonewallet/wallet-library-bitcoin-ios"

  s.license      = "MIT"
  s.author       = "WalletLibBitcoin"

  s.source       = { :git => "https://github.com/noonewallet/wallet-library-bitcoin-ios.git", :tag => "v#{s.version}", :submodules => true }
  s.swift_version = '5.0'

  s.source_files  = 'WalletLibBitcoin/*{swift}', 'WalletLibBitcoin/**/*{swift}'

  s.ios.dependency 'WalletLibCrypto'
  s.osx.dependency 'WalletLibCrypto'
  s.ios.dependency 'WalletLibBitcoinScript'
  s.osx.dependency 'WalletLibBitcoinScript'
  s.ios.dependency 'WalletLibAddressBech32'
  s.osx.dependency 'WalletLibAddressBech32'
 
  s.ios.deployment_target = "11.0"
  s.osx.deployment_target = "11.0"

end
