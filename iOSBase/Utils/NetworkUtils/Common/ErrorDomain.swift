//
//  ErrorDomain.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 31/10/2023.
//

import Foundation

enum ErrorDomain: String {
  case network = "NetworkError"

  var name: String {
    return [Bundle.main.bundleIdentifier, rawValue]
      .compactMap { $0 }
      .joined(separator: ".")
  }
}
