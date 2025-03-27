//
//  Untitled.swift
//  testSwiftUI
//
//  Created by walid on 26/3/2025.
//

import Foundation

class MockJSONDataLoader: JSONDataLoader { 
    var mockData: [User] = []
    var shouldThrowError: Bool = false
    
    func getItems<T: Decodable>(from fileName: String, type: T.Type, isArray: Bool = true) async throws -> T {
        if shouldThrowError {
            throw NSError(domain: "TestError", code: 1, userInfo: nil)
        }
        guard let users = mockData as? T else {
            throw NSError(domain: "TestError", code: 2, userInfo: nil)
        }
        return users
    }
}
