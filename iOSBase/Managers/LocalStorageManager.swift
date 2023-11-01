//
//  LocalStorageManager.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 31/10/2023.
//

import Foundation

final class LocalStorageManager: LocalStorageClient {
    
    var localStorage: LocalStorage
    
    static let userDefaults = LocalStorageManager(localStorage: UserDefaultsUtils())
    static let realm = LocalStorageManager(localStorage: RealmUtils())
    
    init(localStorage: LocalStorage) {
        self.localStorage = localStorage
    }
    
    func create(data: LocalStorageData) {
        var convertedData: LocalStorageInputCreateData
        switch localStorage {
        case is UserDefaultsUtils:
            convertedData = LocalStorageInputCreateData.userDefaults(data)
        case is RealmUtils:
            convertedData = LocalStorageInputCreateData.realm(data)
        default:
            return
        }
        localStorage.create(data: convertedData)
    }
    
    func read(data: LocalStorageData) -> Any? {
        var convertedData: LocalStorageInputReadData
        switch localStorage {
        case is UserDefaultsUtils:
            convertedData = LocalStorageInputReadData.userDefaults(data)
        case is RealmUtils:
            convertedData = LocalStorageInputReadData.realm(data)
        default:
            return nil
        }
        return localStorage.read(data: convertedData)
    }
    
    func update(data: LocalStorageData) {
        var convertedData: LocalStorageInputUpdateData
        switch localStorage {
        case is UserDefaultsUtils:
            convertedData = LocalStorageInputUpdateData.userDefaults(data)
        case is RealmUtils:
            convertedData = LocalStorageInputUpdateData.realm(data)
        default:
            return
        }
        localStorage.update(data: convertedData)
    }
    
    func delete(data: LocalStorageData) {
        var convertedData: LocalStorageInputDeleteData
        switch localStorage {
        case is UserDefaultsUtils:
            convertedData = LocalStorageInputDeleteData.userDefaults(data)
        case is RealmUtils:
            convertedData = LocalStorageInputDeleteData.realm(data)
        default:
            return
        }
        localStorage.delete(data: convertedData)
    }
}
