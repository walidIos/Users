//
//  DetailUser.swift
//  testSwiftUI
//
//  Created by walid on 20/3/2025.
//

import SwiftUI

struct UserDetailView: View {
    let user: User

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: user.image)) { image in
                image.resizable()
                     .scaledToFill()
            } placeholder: {
                ProgressView()  // Affiche un chargement en attendant l'image
            }
            .frame(width: 150, height: 150)
            .clipShape(Circle())

            Text(user.name)
                .font(.title)
                .fontWeight(.bold)

            Text(user.description)
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding()

            Spacer()
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
        .withBackButton() 
    }
}
#Preview {
    UserDetailView(user: User(id: 1, image: "https://randomuser.me/api/portraits/women/20.jpg", name: "walid", description: "developpeur Ios"))
}
