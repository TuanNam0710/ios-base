//
//  MultipartMedia.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 31/10/2023.
//

import Foundation

enum MimeType {
  case jpeg
  case bmp
  case png
  case mov
  case mpeg
  case avi
  case json
  case custom(contentType: String, extension: String)
  
  var contentType: String {
    switch self {
    case .jpeg:
      return "image/jpeg"
    case .bmp:
      return "image/bmp"
    case .png:
      return "image/png"
    case .mov:
      return "video/quicktime"
    case .mpeg:
      return "video/mpeg"
    case .avi:
      return "video/avi"
    case .json:
      return "application/json"
    case .custom(let contentType, _):
      return contentType
    }
  }
  
  var fileExtension: String {
    switch self {
    case .jpeg:
      return ".jpg"
    case .bmp:
      return ".bmp"
    case .png:
      return ".png"
    case .mov:
      return ".mov"
    case .mpeg:
      return ".mpeg"
    case .avi:
      return ".avi"
    case .json:
      return ".json"
    case .custom( _, let fileExtension):
      return fileExtension
    }
  }
}

class MultipartMedia {
  var key: String // key name to send file
  var fileName: String // file name
  var data: Data
  var type: MimeType

  var toFile: String {
    fileName.validFilename + type.fileExtension
  }
  
  init(fileName: String, key: String, data: Data, type: MimeType = .jpeg) {
    self.key = key
    self.data = data
    self.type = type
    self.fileName = fileName
  }
}
