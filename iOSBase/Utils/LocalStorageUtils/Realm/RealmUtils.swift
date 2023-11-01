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
    
    func create(data: LocalStorageInputCreateData) {
        if case let .realm(data) = data,
           let object = data.object {
            try? realm?.write({
                realm?.add(object)
            })
        }
    }
    
    func read(data: LocalStorageInputReadData) -> Any? {
        if case let .realm(data) = data, let type = data.objectType {
            return realm?.objects(type)
        }
        return nil
    }
    
    func update(data: LocalStorageInputUpdateData) {
        if case let .realm(data) = data,
           let object = data.object {
            try? realm?.write({
                realm?.add(object, update: .modified)
            })
        }
    }
    
    func delete(data: LocalStorageInputDeleteData) {
        if case let .realm(data) = data,
           let object = data.object {
            try? realm?.write({
                realm?.delete(object)
            })
        }
    }
}
