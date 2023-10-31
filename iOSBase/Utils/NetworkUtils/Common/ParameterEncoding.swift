//
//  ParameterEncoding.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 31/10/2023.
//

import Foundation

enum ParameterEncoding {
    /// The parameters are encoded in the HTTP request body.
    case httpBody(HTTPBodyEncoding)

    /// The parameters are encoded in a query string into the request URL.
    case urlQuery
}

/// The formats available for the parameters encoded in the HTTP request body
enum HTTPBodyEncoding {
    /// The parameters are sent in JSON format.
    case json
    /// The parameters are sent as-is, encoded in a Data object.
    case plain
}
