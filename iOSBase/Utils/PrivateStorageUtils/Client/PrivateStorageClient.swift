//
//  PrivateStorageClient.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 01/11/2023.
//

import Foundation

protocol PrivateStorageClient {
    
    init(privateStorage: PrivateStorage)
    
    func create(data: PrivateStorageData)
    
    func read(data: PrivateStorageData) -> Any?
    
    func update(data: PrivateStorageData)
    
    func delete(data: PrivateStorageData)
}
