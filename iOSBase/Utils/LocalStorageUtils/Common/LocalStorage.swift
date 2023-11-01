//
//  LocalStorage.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 31/10/2023.
//

import Foundation
import RealmSwift

enum LocalStorageInputCreateData {
    case userDefaults(LocalStorageData)
    case realm(LocalStorageData)
}

enum LocalStorageInputReadData {
    case userDefaults(LocalStorageData)
    case realm(LocalStorageData)
}

enum LocalStorageInputUpdateData {
    case userDefaults(LocalStorageData)
    case realm(LocalStorageData)
}

enum LocalStorageInputDeleteData {
    case userDefaults(LocalStorageData)
    case realm(LocalStorageData)
}

protocol LocalStorageData {}

extension LocalStorageData {
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
    
    var object: Object? {
        if let object = self as? Object {
            return object
        }
        return nil
    }
    
    var objectType: Object.Type? {
        if let type = self as? Object.Type {
            return type
        }
        return nil
    }
}

extension String: LocalStorageData {}
extension Dictionary: LocalStorageData where Key == String, Value == Any {}
extension Object: LocalStorageData {}


protocol LocalStorage {
    
    func create(data: LocalStorageInputCreateData)
    
    func read(data: LocalStorageInputReadData) -> Any?
    
    func update(data: LocalStorageInputUpdateData)
    
    func delete(data: LocalStorageInputDeleteData)
    
}
