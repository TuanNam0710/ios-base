//
//  LocalStorage.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 31/10/2023.
//

import Foundation
import RealmSwift

enum LocalStorageInputCreateData {
    case userDefaults([String: Any])
    case realm(Object)
}

enum LocalStorageInputReadData {
    case userDefaults(String)
    case realm(Object.Type)
}

enum LocalStorageInputUpdateData {
    case userDefaults([String: Any])
    case realm(Object)
}

enum LocalStorageInputDeleteData {
    case userDefaults(String)
    case realm(Object)
}

protocol LocalStorage {
    
    func create(data: LocalStorageInputCreateData) throws
    
    func read(data: LocalStorageInputReadData) throws -> Any?
    
    func update(data: LocalStorageInputUpdateData) throws
    
    func delete(data: LocalStorageInputDeleteData) throws
    
}
