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
        switch data.self {
        case .userDefaults(let dict):
            for (key, value) in dict {
                userDefaults.setValue(value, forKey: key)
            }
        default:
            throw NSError()
        }
    }
    
    func read(data: LocalStorageInputReadData) throws -> Any? {
        switch data.self {
        case .userDefaults(let key):
            return userDefaults.object(forKey: key)
        default:
            throw NSError()
        }
    }
    
    func update(data: LocalStorageInputUpdateData) throws {
        switch data.self {
        case .userDefaults(let dict):
            for (key, value) in dict where userDefaults.object(forKey: key) != nil {
                userDefaults.setValue(value, forKey: key)
            }
        default:
            throw NSError()
        }
    }
    
    func delete(data: LocalStorageInputDeleteData) throws {
        switch data.self {
        case .userDefaults(let key):
            userDefaults.removeObject(forKey: key)
        default:
            throw NSError()
        }
    }
}
