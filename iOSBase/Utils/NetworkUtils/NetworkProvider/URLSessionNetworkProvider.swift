//
//  URLSessionNetworkProvider.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 31/10/2023.
//

import UIKit

final class URLSessionNetworkProvider: NetworkProvider {
    
    func request(endpoint: Endpoint, completion: @escaping (Result<Network.Response, Error>) -> Void) -> Cancellable {
        var request = URLRequest(url: endpoint.requestURL)
        request.httpMethod = endpoint.method.urlSessionMethod
        request.allHTTPHeaderFields = endpoint.headers
        for parameter in endpoint.parameters where parameter.value is String {
            request.addValue(parameter.value as! String, forHTTPHeaderField: parameter.key)
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(Network.ProviderError.noResponse))
                return
            }
            
            if (200...299).contains(httpResponse.statusCode) {
                if let data = data {
                    completion(.success(Network.Response(statusCode: httpResponse.statusCode, data: data, headers: httpResponse.allHeaderFields)))
                } else {
                    completion(.failure(Network.ProviderError.noResponse))
                }
            } else {
                completion(.failure(Network.ProviderError.noResponse))
            }
        }
        
        task.resume()
        return URLSessionCancellable(task: task)
    }
    
    func multipartRequest(endpoint: Endpoint, multipartFormKey: String, media: [MultipartMedia], completion: @escaping (Result<Network.Response, Error>) -> Void) -> Cancellable {
        var request = URLRequest(url: endpoint.requestURL)
        request.httpMethod = endpoint.method.urlSessionMethod
        
        let boundary = UUID().uuidString
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        var imageDataSet: [Data] = []
        for image in media {
            imageDataSet.append(image.data)
        }
        var body = Data()
        for (key, value) in endpoint.parameters {
            body.append("--\(boundary)\r\n".data(using: .utf8)!)
            body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: .utf8)!)
            body.append("\(value)\r\n".data(using: .utf8)!)
        }
        
        for image in media {
            body.append("--\(boundary)\r\n".data(using: .utf8)!)
            body.append("Content-Disposition: form-data; name=\"image\"; filename=\"\(image.fileName)\"\r\n".data(using: .utf8)!)
            body.append("Content-Type: \(image.type.contentType)\r\n\r\n".data(using: .utf8)!)
            body.append(image.data)
            body.append("\r\n".data(using: .utf8)!)
            body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        }
        
        request.httpBody = body
        
        let task = URLSession.shared.dataTask(with: endpoint.requestURL) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(Network.ProviderError.noResponse))
                return
            }
            
            if (200...299).contains(httpResponse.statusCode) {
                if let data = data {
                    completion(.success(Network.Response(statusCode: httpResponse.statusCode, data: data, headers: httpResponse.allHeaderFields)))
                } else {
                    completion(.failure(Network.ProviderError.noResponse))
                }
            } else {
                completion(.failure(Network.ProviderError.noResponse))
            }
        }
        
        task.resume()
        return URLSessionCancellable(task: task)
    }
}

extension Network.HTTPMethod {
    var urlSessionMethod: String {
        return self.rawValue
    }
}

class URLSessionCancellable: Cancellable {
    private var task: URLSessionDataTask?
    
    init(task: URLSessionDataTask? = nil) {
        self.task = task
    }
    
    func cancel() -> Self {
        task?.cancel()
        return self
    }
}
