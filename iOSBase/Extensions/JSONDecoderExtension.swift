//
//  JSONDecoderExtension.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 31/10/2023.
//

import Foundation

extension JSONDecoder {
  
  public convenience init(decodingConfig: DecodingConfiguration) {
    self.init()
    
    dateDecodingStrategy = decodingConfig.dateStrategy
    keyDecodingStrategy = decodingConfig.keyStrategy
    dataDecodingStrategy = decodingConfig.dataStrategy
  }
  
}
