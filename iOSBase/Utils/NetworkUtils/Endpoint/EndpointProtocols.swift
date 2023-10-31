//
//  APIEndpoint.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 31/10/2023.
//

import Foundation

protocol EndpointProtocols: Endpoint {
    var baseURL: String { get }
    var path: String { get }
}

extension EndpointProtocols {
    var requestURL: URL {
        if #available(iOS 16.0, *) {
            guard let url = URL(string: baseURL)?.appending(path: path, directoryHint: .inferFromPath) else {
                fatalError("URL for endpoint at \(path) could not be constructed")
            }
            return url
        } else {
            guard let url = URL(string: baseURL)?.appendingPathComponent(path) else {
                fatalError("URL for endpoint at \(path) could not be constructed")
            }
            return url
        }
    }
}
