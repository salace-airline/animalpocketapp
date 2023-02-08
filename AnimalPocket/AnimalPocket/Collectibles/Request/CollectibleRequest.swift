//
//  CollectibleRequest.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 08/02/2023.
//

import Foundation

class CollectibleRequest: Request {
  private let baseURL = URL(string: "https://acnhapi.com/v1a")
  private let path: String
  
  init(path: String) {
    self.path = path
  }
  
  func asURLRequest() throws -> URLRequest {
    guard var baseURL else {
      throw NetworkingError.issueWithURL
    }
    if !path.isEmpty {
      baseURL.appendPathComponent(path)
    }
    let request = URLRequest(url: baseURL)
    return request
  }
}