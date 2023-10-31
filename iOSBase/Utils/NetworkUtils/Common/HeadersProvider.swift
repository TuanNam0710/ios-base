//
//  HeadersProvider.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 31/10/2023.
//

import Foundation

public protocol HeadersProvider {
  var requestHeaders: [String: String] { get }
}

extension Dictionary: HeadersProvider where Key == String, Value == String {

    public var requestHeaders: [String : String] {
        self
    }

}

