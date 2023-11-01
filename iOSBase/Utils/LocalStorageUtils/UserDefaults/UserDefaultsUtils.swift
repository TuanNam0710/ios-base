//
//  UserDefaultsUtils.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 31/10/2023.
//

import Foundation

final class UserDefaultsUtils: LocalStorage {
    
    private let userDefaults = UserDefaults.standard
    
    func create(data: LocalStorageInputCreateData) {
        if case let .userDefaults(dict) = data,
           let dict = dict.dictionary {
            for (key, value) in dict {
                userDefaults.setValue(value, forKey: key)
            }
        }
    }
    
    func read(data: LocalStorageInputReadData) -> Any? {
        if case let .userDefaults(key) = data,
           let key = key.string {
            return userDefaults.object(forKey: key)
        }
        return nil
    }
    
    func update(data: LocalStorageInputUpdateData) {
        if case let .userDefaults(dict) = data,
           let dict = dict.dictionary {
            for (key, value) in dict where userDefaults.object(forKey: key) != nil {
                userDefaults.setValue(value, forKey: key)
            }
        }
    }
    
    func delete(data: LocalStorageInputDeleteData) {
        if case let .userDefaults(key) = data,
           let key = key.string {
            userDefaults.removeObject(forKey: key)
        }
    }
}
