//
//  LocalStorageClient.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 31/10/2023.
//

import Foundation

protocol LocalStorageClient {
    
    init(localStorage: LocalStorage)
    
    func create(data: LocalStorageData)
    
    func read(data: LocalStorageData) -> Any?
    
    func update(data: LocalStorageData)
    
    func delete(data: LocalStorageData)
    
}
