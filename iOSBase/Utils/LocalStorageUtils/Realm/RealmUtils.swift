//
//  RealmUtils.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 31/10/2023.
//

import Foundation
import RealmSwift

final class RealmUtils: LocalStorage {
    
    let realm = try? Realm()
    
    func create(data: LocalStorageInputCreateData) throws {
        if case let .realm(object) = data {
            try realm?.write({
                realm?.add(object)
            })
        }
    }
    
    func read(data: LocalStorageInputReadData) throws -> Any? {
        if case let .realm(type) = data {
            return realm?.objects(type)
        }
        return nil
    }
    
    func update(data: LocalStorageInputUpdateData) throws {
        if case let .realm(object) = data {
            try realm?.write({
                realm?.add(object, update: .modified)
            })
        }
    }
    
    func delete(data: LocalStorageInputDeleteData) throws {
        if case let .realm(object) = data {
            try realm?.write({
                realm?.delete(object)
            })
        }
    }
}
