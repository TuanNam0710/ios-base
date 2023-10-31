//
//  APIManager+URLSession.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 31/10/2023.
//

import Foundation

extension APIManager {
    static let urlSession = APIManager(networkProvider: URLSessionNetworkProvider())
}
