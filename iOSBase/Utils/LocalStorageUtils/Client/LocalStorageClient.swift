//
//  LocalStorageClient.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 31/10/2023.
//

import Foundation

protocol LocalStorageClient {
    
    init(localStorage: LocalStorage)
    
    func create(data: LocalStorageInputCreateData) throws
    
    func read(data: LocalStorageInputReadData) throws -> Any?
    
    func update(data: LocalStorageInputUpdateData) throws
    
    func delete(data: LocalStorageInputDeleteData) throws
    
}
