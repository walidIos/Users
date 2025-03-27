//
//  Untitled.swift
//  testSwiftUI
//
//  Created by walid on 26/3/2025.
//

import XCTest
@testable import Users

class GetUsersUseCaseTests: XCTestCase {
    
    var getUsersUseCase: GetUsersUseCase!
    var mockUserRepository: MockUserRepository!
    
    override func setUp() {
           super.setUp()
           // Prépare les données simulées
           let mockUsers = [
               User(id: 1, image: "", name: "Alice", description: "Dev iOS"),
               User(id: 2, image: "", name: "Bob", description: "Dev iOS")
           ]
           
           // Crée le mock et le use case
           mockUserRepository = MockUserRepository(userToreturn: mockUsers)
           getUsersUseCase = GetUsersUseCaseImp(userRepository: mockUserRepository)
       }
    
    override func tearDown() {
          getUsersUseCase = nil
          mockUserRepository = nil
          super.tearDown()
      }
    func testExecute_returnsUsers() async throws {
           // Appeler la méthode execute
           let users = try await getUsersUseCase.execute()
           
           // Vérifier que le nombre d'utilisateurs est correct
           XCTAssertEqual(users.count, 2)
           
           // Vérifier que les utilisateurs retournés sont les bons
           XCTAssertEqual(users.first?.name, "Alice")
           XCTAssertEqual(users.last?.name, "Bob")
       }
    
    
}
