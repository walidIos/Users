//
//  Untitled.swift
//  testSwiftUI
//
//  Created by walid on 26/3/2025.
//

import XCTest
@testable import Users
@MainActor

class UserListViewModelTests: XCTest {
    
    var userListViewModel: UserListViewModel!
    var mockUsersUsesCase: MockUsersUsesCase!
    
    override func setUp() {
        super.setUp()
        let mockUsers = [
            User(id: 1, image: "", name: "Alice", description: "Dev iOS"),
            User(id: 2, image: "", name: "Bob", description: "Dev iOS")
        ]
        mockUsersUsesCase = MockUsersUsesCase(UsersToget: mockUsers)
        userListViewModel = UserListViewModelImp(getUsersUseCase: mockUsersUsesCase)
    }
    
    override func tearDown() {
        mockUsersUsesCase = nil
        userListViewModel = nil
        super.tearDown()
    }
    
    func testLoadUsers_success() async {
        
        mockUsersUsesCase.shouldReturnError = false
        
        await userListViewModel.loadUsers()
        
        XCTAssertEqual(userListViewModel.users.count, 2)
        XCTAssertEqual(userListViewModel.users.first?.name, "Alice")
        XCTAssertEqual(userListViewModel.users.last?.name, "Bob")
        XCTAssertNil(userListViewModel.errorMessage)
    }
    
    func testLoadUsers_failure() async {
        
        mockUsersUsesCase.shouldReturnError = true
        await userListViewModel.loadUsers()
        XCTAssertEqual(userListViewModel.users.count, 0)  // Pas d'utilisateurs chargés
        XCTAssertNotNil(userListViewModel.errorMessage)   // Un message d'erreur
        XCTAssertEqual(userListViewModel.errorMessage, "Erreur : Test error occurred")
    }
}
