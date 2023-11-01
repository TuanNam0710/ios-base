//
//  PrivateStorageManager.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 31/10/2023.
//

import Foundation

final class PrivateStorageManager: PrivateStorageClient {
    
    var privateStorage: PrivateStorage
    
    static let keychain = PrivateStorageManager(privateStorage: KeyChainUtils())
    
    init(privateStorage: PrivateStorage) {
        self.privateStorage = privateStorage
    }
    
    func create(data: PrivateStorageData) {
        var convertedData: PrivateStorageInputCreateData
        switch privateStorage {
        case is KeyChainUtils:
            convertedData = PrivateStorageInputCreateData.keychain(data)
        default:
            return
        }
        privateStorage.create(data: convertedData)
    }
    
    func read(data: PrivateStorageData) -> Any? {
        var convertedData: PrivateStorageInputReadData
        switch privateStorage {
        case is KeyChainUtils:
            convertedData = PrivateStorageInputReadData.keychain(data)
        default:
            return nil
        }
        return privateStorage.read(data: convertedData)
    }
    
    func update(data: PrivateStorageData) {
        var convertedData: PrivateStorageInputUpdateData
        switch privateStorage {
        case is KeyChainUtils:
            convertedData = PrivateStorageInputUpdateData.keychain(data)
        default:
            return
        }
        privateStorage.update(data: convertedData)
    }
    
    func delete(data: PrivateStorageData) {
        var convertedData: PrivateStorageInputDeleteData
        switch privateStorage {
        case is KeyChainUtils:
            convertedData = PrivateStorageInputDeleteData.keychain(data)
        default:
            return
        }
        privateStorage.delete(data: convertedData)
    }
    
    
}
