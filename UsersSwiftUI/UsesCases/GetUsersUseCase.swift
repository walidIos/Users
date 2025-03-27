//
//  GetUsersUseCase.swift
//  testSwiftUI
//
//  Created by walid on 20/3/2025.
//

import Foundation



protocol GetUsersUseCase {
    func execute() async throws -> [User]
}
class GetUsersUseCaseImp: GetUsersUseCase {
    private let userRepository: UserRepository

    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }

    func execute() async throws -> [User] {
        return try await userRepository.getUsers()
    }
}
