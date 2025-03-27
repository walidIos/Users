//
//  ContentView.swift
//  testSwiftUI
//
//  Created by walid on 20/3/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = UserListViewModelImp(getUsersUseCase: GetUsersUseCaseImp(userRepository: UserRepositoryImpl(jsonDataLoader: JSONDataLoaderImp())))
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Bienvenue dans mon projet SwiftUI")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding()
                if let error = viewModel.errorMessage {
                    ErrorView(message: error, retryAction: {  Task { await viewModel.loadUsers()}
                    })
                    .padding()
                } else {
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(viewModel.users) { user in
                                NavigationLink(destination: UserDetailView(user: user)) {
                                    ItemView(user: user)
                                        .background(Color.clear)
                                        .padding()
                                }
                            }
                            
                        }
                       
                    }
                }
                
                
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(Color.gray.opacity(0.2)) 
            .task {
               await viewModel.loadUsers()
                
            }
            .navigationTitle("Utilisateurs")
            
        }
    }
}

#Preview {
    ContentView()
}
