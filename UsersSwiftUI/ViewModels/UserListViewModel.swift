//
//  Untitled.swift
//  testSwiftUI
//
//  Created by walid on 20/3/2025.
//

import SwiftUI
@MainActor
protocol UserListViewModel {
    var users: [User] { get set }
    var errorMessage: String? { get set }
    func loadUsers() async
}
class UserListViewModelImp: ObservableObject, UserListViewModel {
    @Published var users: [User] = []
    @Published var errorMessage: String? = nil

    private let getUsersUseCase: GetUsersUseCase

    init(getUsersUseCase: GetUsersUseCase) {
        self.getUsersUseCase = getUsersUseCase
    }

    func loadUsers() async {
        do {
            self.users = try await getUsersUseCase.execute()
        } catch {
            self.errorMessage = "Erreur : \(error.localizedDescription)"
        }
    }
}
