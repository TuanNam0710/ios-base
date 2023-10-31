//
//  Network.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 31/10/2023.
//

import Foundation

enum Network {
    enum HTTPMethod: String {
        case get
        case post
        case put
        case patch
        case delete
    }
    
    enum StatusCode {
        static let badrequest = 400
        static let unauthorized = 401
        static let forbidden = 403
        static let notfound = 404
    }
    
    struct Response {
        let statusCode: Int
        
        let data: Data?
        
        let headers: [AnyHashable: Any]
        
        init(statusCode: Int, data: Data?, headers: [AnyHashable : Any]) {
            self.statusCode = statusCode
            self.data = data
            self.headers = headers
        }
    }
    
    struct EmptyResponse: Decodable {}
    
    enum ProviderError: Error {
        case noResponse
    }
    
    enum ContentType {
        static let plainText = "text/plain"
        static let applicationURLForm = "application/x-www-form-urlencoded"
        static let applicationJSON = "application/json"
        static let applicationXML = "application/xml"
        static let multipartForm = "multipart/form-data"
    }
}
