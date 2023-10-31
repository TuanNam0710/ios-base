//
//  APIEndpoint.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 31/10/2023.
//

import Foundation

struct APIEndpoint: Endpoint {

  private let headersProvider: HeadersProvider
  private let endpoint: Endpoint

  init(endpoint: Endpoint, headersProvider: HeadersProvider) {
    self.endpoint = endpoint
    self.headersProvider = headersProvider
  }

  var requestURL: URL {
    endpoint.requestURL
  }

  var method: Network.HTTPMethod {
    endpoint.method
  }

  /// Endpoint headers will replace any duplicate from the HeaderProvider.
  var headers: [String: String] {
      headersProvider.requestHeaders.merging(endpoint.headers) { _, new in new }
  }

  var parameters: [String: Any] {
    endpoint.parameters
  }

  var decodingConfiguration: DecodingConfiguration? {
    endpoint.decodingConfiguration
  }

  var parameterEncoding: ParameterEncoding {
      endpoint.parameterEncoding
  }

}
