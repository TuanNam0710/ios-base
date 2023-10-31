//
//  LocalStorageManager+Realm.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 31/10/2023.
//

import Foundation

extension LocalStorageManager {
    static let realm = LocalStorageManager(localStorage: RealmUtils())
}
