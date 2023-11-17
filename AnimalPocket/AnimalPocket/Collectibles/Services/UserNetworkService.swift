//
//  UserNetworkService.swift
//  AnimalPocket
//
//  Created by Sarah WATREMET on 01/11/2023.
//

import Foundation

enum UserNetworkService {
  static func registerUser(with parameters: UserInfo, path: String) async throws -> UserResponse {
    try await AuthRequest(userParameters: parameters, path: path)
      .asURLRequest()
      .fetch(responseType: UserResponse.self)
  }
  
  static func loginUser(with parameters: UserInfo, path: String) async throws -> AuthResponse {
    try await AuthRequest(userParameters: parameters, path: path)
      .asURLRequest()
      .fetch(responseType: AuthResponse.self)
  }
  
  static func updateUserCollection(with itemNumber: Int, path: String) async throws -> UserItems {
    try await UpdateRequest(itemNumber: itemNumber, path: path)
      .asURLRequest()
      .fetch(responseType: UserItems.self)
  }
  
  static func getUser(with path: String) async throws -> AuthResponse {
    try await UserRequest(path: path)
      .asURLRequest()
      .fetch(responseType: AuthResponse.self)
  }
}
