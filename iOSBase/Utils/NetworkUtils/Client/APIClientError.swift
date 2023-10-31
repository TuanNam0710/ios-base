//
//  APIClientError.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 31/10/2023.
//

import Foundation

enum APIClientError: LocalizedError {
    case invalidEmptyResponse
    case statusCodeInvalid
    
    var domain: ErrorDomain {
        .network
    }

    var code: Int {
        switch self {
        case .invalidEmptyResponse:
            return 1
        case .statusCodeInvalid:
            return 2
        }
    }

    var errorDescription: String? {
        switch self {
        case .invalidEmptyResponse:
            return NSLocalizedString("Unexpected empty response", comment: "")
        case .statusCodeInvalid:
            return NSLocalizedString("Status code invalid", comment: "")
        }
    }

}
