# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'WalletLibBitcoin' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for WalletLibBitcoin
  pod 'WalletLibCrypto', :git => 'https://github.com/noonewallet/wallet-library-crypto-ios'
  pod 'WalletLibBitcoinScript', :git => 'https://github.com/noonewallet/wallet-library-bitcoin-script-ios'
  pod 'WalletLibAddressBech32', :git => 'https://github.com/noonewallet/wallet-library-address-bech32-ios'
  
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['GCC_WARN_UNUSED_FUNCTION'] = 'NO'
      end
    end
  end

  target 'WalletLibBitcoinTests' do
    # Pods for testing
  end

end
