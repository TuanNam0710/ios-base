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
        switch data.self {
        case .realm(let object):
            try realm?.write({
                realm?.add(object)
            })
        default:
            throw NSError()
        }
    }
    
    func read(data: LocalStorageInputReadData) throws -> Any? {
        switch data.self {
        case .realm(let type):
            return realm?.objects(type)
        default:
            throw NSError()
        }
    }
    
    func update(data: LocalStorageInputUpdateData) throws {
        switch data.self {
        case .realm(let object):
            try realm?.write({
                realm?.add(object, update: .modified)
            })
        default:
            throw NSError()
        }
    }
    
    func delete(data: LocalStorageInputDeleteData) throws {
        switch data.self {
        case .realm(let object):
            try realm?.write({
                realm?.delete(object)
            })
        default:
            throw NSError()
        }
    }
}
