//
//  Untitled.swift
//  testSwiftUI
//
//  Created by walid on 26/3/2025.
//

import XCTest
@testable import Users

class MockUsersUsesCase: GetUsersUseCase {
    var UsersToget: [User]
    var shouldReturnError = false
    
    init(UsersToget: [User]) {
        self.UsersToget = UsersToget
    }
    
    func execute() async throws -> [User] {
        if shouldReturnError {
            throw NSError(domain: "TestError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Test error occurred"])
        } else {
            return UsersToget
        }
        
    }
}
