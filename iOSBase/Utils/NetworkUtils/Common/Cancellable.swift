//
//  Cancellable.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 31/10/2023.
//

import Foundation

protocol Cancellable {
  func cancel() -> Self
}

struct AnyCancellable: Cancellable {
    func cancel() -> AnyCancellable {
        return self
    }
}
