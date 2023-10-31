//
//  DecodingConfiguration.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 31/10/2023.
//

import Foundation

public struct DecodingConfiguration {
  
  public static let `default` = DecodingConfiguration()
  
  let dateStrategy: JSONDecoder.DateDecodingStrategy
  let keyStrategy: JSONDecoder.KeyDecodingStrategy
  let dataStrategy: JSONDecoder.DataDecodingStrategy
  
  public init(
    dateStrategy: JSONDecoder.DateDecodingStrategy = .iso8601,
    keyStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
    dataStrategy: JSONDecoder.DataDecodingStrategy = .base64
  ) {
    self.dateStrategy = dateStrategy
    self.keyStrategy = keyStrategy
    self.dataStrategy = dataStrategy
  }
}
