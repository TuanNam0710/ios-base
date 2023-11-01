//
//  PrivateStorage.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 01/11/2023.
//

import Foundation

enum PrivateStorageInputCreateData {
    case keychain(PrivateStorageData)
}

enum PrivateStorageInputReadData {
    case keychain(PrivateStorageData)
}

enum PrivateStorageInputUpdateData {
    case keychain(PrivateStorageData)
}

enum PrivateStorageInputDeleteData {
    case keychain(PrivateStorageData)
}

protocol PrivateStorageData {}

extension PrivateStorageData {
    var string: String? {
        if let string = self as? String {
            return string
        }
        return nil
    }
    
    var dictionary: [String: Any]? {
        if let dictionary = self as? [String: Any] {
            return dictionary
        }
        return nil
    }
}

extension String: PrivateStorageData {}
extension Dictionary: PrivateStorageData where Key == String, Value == Any {}

protocol PrivateStorage {
    
    func create(data: PrivateStorageInputCreateData)
    
    func read(data: PrivateStorageInputReadData) -> Any?
    
    func update(data: PrivateStorageInputUpdateData)
    
    func delete(data: PrivateStorageInputDeleteData)
    
}
