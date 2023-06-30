//
//  BitcoinPublicKeyAddress+BitcoinScriptAddressProtocol.swift
//  WalletLibBitcoin
//
//

import Foundation
import WalletLibBitcoinScript


extension BitcoinPublicKeyAddress: BitcoinScriptAddressProtocol {
    
    
    public var scriptHashType: WalletLibBitcoinScript.BitcoinScriptHashType {
        
        switch hashType.value {
            
        case .P2PKH: return .P2PKH
            
        case .P2SH: return .P2SH
            
        case .P2WPKH: return .P2WPKH
            
        case .P2WSH: return .P2WSH
            
        }
        
    }
    

}
