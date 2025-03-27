//
//  Untitled.swift
//  testSwiftUI
//
//  Created by walid on 20/3/2025.
//

import Foundation

protocol UserRepository {
    func getUsers() async throws -> [User]
}

class UserRepositoryImpl: UserRepository {

    private let jsonDataLoader: JSONDataLoader
    
    init(jsonDataLoader: JSONDataLoader) {
        self.jsonDataLoader = jsonDataLoader
    }
    func getUsers() async throws -> [User] {
        return try await jsonDataLoader.getItems(from: "Users", type: [User].self, isArray: true)
    }
}
