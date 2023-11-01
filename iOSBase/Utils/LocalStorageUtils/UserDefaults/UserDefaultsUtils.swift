//
//  UserDefaultsUtils.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 31/10/2023.
//

import Foundation

final class UserDefaultsUtils: LocalStorage {
    
    let userDefaults = UserDefaults.standard
    
    func create(data: LocalStorageInputCreateData) throws {
        if case let .userDefaults(dict) = data {
            for (key, value) in dict {
                userDefaults.setValue(value, forKey: key)
            }
        }
    }
    
    func read(data: LocalStorageInputReadData) throws -> Any? {
        if case let .userDefaults(key) = data {
            return userDefaults.object(forKey: key)
        }
        return nil
    }
    
    func update(data: LocalStorageInputUpdateData) throws {
        if case let .userDefaults(dict) = data {
            for (key, value) in dict where userDefaults.object(forKey: key) != nil {
                userDefaults.setValue(value, forKey: key)
            }
        }
    }
    
    func delete(data: LocalStorageInputDeleteData) throws {
        if case let .userDefaults(key) = data {
            userDefaults.removeObject(forKey: key)
        }
    }
}
