//
//  Endpoint.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 31/10/2023.
//

import Foundation

enum EndpointError: Error {
    case invalidURL
}

protocol Endpoint {
    var requestURL: URL { get }
    var method: Network.HTTPMethod { get }
    
    var headers: [String: String] { get }
    var parameters: [String: Any] { get }
    var decodingConfiguration: DecodingConfiguration? { get }
    var parameterEncoding: ParameterEncoding { get }
}

extension Endpoint {

  // MARK: - Defaults

  var decodingConfiguration: DecodingConfiguration? {
    nil
  }

  var parameters: [String: Any] {
    [:]
  }

  var headers: [String: String] {
    [:]
  }

  var parameterEncoding: ParameterEncoding {
    switch method {
    case .patch, .put, .post:
        return .httpBody(.json)
    default:
      return .urlQuery
    }
  }

}
