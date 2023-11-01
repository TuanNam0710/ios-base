//
//  KeyChainUtils.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 01/11/2023.
//

import Foundation
import Security

final class KeyChainUtils: PrivateStorage {
    
    func create(data: PrivateStorageInputCreateData) {
        if case let .keychain(data) = data,
           let dictionary = data.dictionary {
            for (key, value) in dictionary {
                let query = [
                    kSecClass as String       : kSecClassGenericPassword as String,
                    kSecAttrAccount as String : key,
                    kSecValueData as String   : value ] as [String : Any]
                
                SecItemDelete(query as CFDictionary)
                
                SecItemAdd(query as CFDictionary, nil)
            }
        }
    }
    
    func read(data: PrivateStorageInputReadData) -> Any? {
        if case let .keychain(data) = data,
           let key = data.string {
            let query = [
                kSecClass as String       : kSecClassGenericPassword,
                kSecAttrAccount as String : key,
                kSecReturnData as String  : kCFBooleanTrue!,
                kSecMatchLimit as String  : kSecMatchLimitOne ] as [String : Any]
            
            var dataTypeRef: AnyObject?
            let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
            
            if status == noErr {
                return dataTypeRef as! Data?
            }
        }
        return nil
    }
    
    func update(data: PrivateStorageInputUpdateData) {
        if case let .keychain(data) = data,
           let dictionary = data.dictionary {
            for (key, value) in dictionary {
                let query = [
                    kSecClass as String       : kSecClassGenericPassword as String,
                    kSecAttrAccount as String : key,
                    kSecValueData as String   : value ] as [String : Any]
                
                SecItemDelete(query as CFDictionary)
                
                SecItemAdd(query as CFDictionary, nil)
            }
        }
    }
    
    func delete(data: PrivateStorageInputDeleteData) {
        if case let .keychain(data) = data,
           let key = data.string {
            let query = [
                kSecClass as String       : kSecClassGenericPassword as String,
                kSecAttrAccount as String : key ] as [String : Any]
            
            SecItemDelete(query as CFDictionary)
        }
    }
    
}
