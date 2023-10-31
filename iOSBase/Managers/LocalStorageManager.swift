//
//  LocalStorageManager.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 31/10/2023.
//

import Foundation

final class LocalStorageManager: LocalStorageClient {
    
    var localStorage: LocalStorage
    
    init(localStorage: LocalStorage) {
        self.localStorage = localStorage
    }
    
    func create(data: LocalStorageInputCreateData) throws {
        try localStorage.create(data: data)
    }
    
    func read(data: LocalStorageInputReadData) throws -> Any? {
        try localStorage.read(data: data)
    }
    
    func update(data: LocalStorageInputUpdateData) throws {
        try localStorage.update(data: data)
    }
    
    func delete(data: LocalStorageInputDeleteData) throws {
        try localStorage.delete(data: data)
    }
}
