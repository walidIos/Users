//
//  Untitled.swift
//  testSwiftUI
//
//  Created by walid on 26/3/2025.
//

import XCTest
@testable import Users

final class UserRepositoryTests: XCTestCase {
    var repository: UserRepositoryImpl!
    var mockLoader: MockJSONDataLoader!
    
    override func setUp() {
        super.setUp()
        mockLoader = MockJSONDataLoader()
        repository = UserRepositoryImpl(jsonDataLoader: mockLoader)
    }
    
    override func tearDown() {
        repository = nil
        mockLoader = nil
        super.tearDown()
    }
    
    func testGetUsers_Success() async throws {
        // GIVEN : Des données simulées
        let expectedUsers = [
            User(id: 1, image: "", name: "Alice", description: "dev ios"),
            User(id: 2, image: "", name: "Bob", description: "dev ios")
        ]
        mockLoader.mockData = expectedUsers
        
        // WHEN
        let users = try await repository.getUsers()
        
        // THEN
        XCTAssertEqual(users.count, 2)
        XCTAssertEqual(users.first?.name, "Alice")
    }
    
    func testGetUsers_ThrowsError() async {
        // GIVEN : Une erreur simulée
        mockLoader.shouldThrowError = true
        
        // WHEN / THEN
        do {
            _ = try await repository.getUsers()
            XCTFail("getUsers aurait dû lever une erreur")
        } catch {
            XCTAssertNotNil(error)
        }
    }
}
