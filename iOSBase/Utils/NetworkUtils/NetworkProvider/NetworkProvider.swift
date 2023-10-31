//
//  NetworkProvider.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 31/10/2023.
//

import Foundation

protocol NetworkProvider {

  /// Performs a HTTP request to the given `Endpoint`.
  /// - Parameters:
  ///   - endpoint: An object conforming to `Endpoint` providing the request information.
  ///   - completion: The closure executed after the request is completed.
  /// - Returns: A `Cancellable` request.
  func request(
    endpoint: Endpoint,
    completion: @escaping (Result<Network.Response, Error>) -> Void
  ) -> Cancellable

  /// Performs a multipart request to upload one or many `MultipartMedia` objects.
  /// - Parameters:
  ///   - endpoint: An object conforming to `Endpoint` providing the request information.
  ///   - completion: The closure executed after the request is completed.
  /// - Returns: A `Cancellable` request.
  func multipartRequest(
    endpoint: Endpoint,
    multipartFormKey: String,
    media: [MultipartMedia],
    completion: @escaping (Result<Network.Response, Error>) -> Void
  ) -> Cancellable
}
