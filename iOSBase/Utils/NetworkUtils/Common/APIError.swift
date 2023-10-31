//
//  APIError.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 31/10/2023.
//

import Foundation

struct APIError: LocalizedError {
  let statusCode: Int

  init?(
    response: Network.Response
  ) {
    self.statusCode = response.statusCode
  }
}
