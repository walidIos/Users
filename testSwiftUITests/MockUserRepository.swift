//
//  Untitled.swift
//  testSwiftUI
//
//  Created by walid on 26/3/2025.
//

import XCTest
@testable import Users

class MockUserRepository: UserRepository {
    var userToreturn: [User]
    
    init(userToreturn: [User]) {
        self.userToreturn = userToreturn
    }
    
    func getUsers() async throws -> [User] {
        return userToreturn
    }
}
