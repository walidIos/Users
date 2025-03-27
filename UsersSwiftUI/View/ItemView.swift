//
//  Untitled.swift
//  testSwiftUI
//
//  Created by walid on 20/3/2025.
//
import SwiftUI

struct ItemView: View {
    
    let user: User
    
    var body: some View {
        HStack(spacing: 10) {
            AsyncImage(url: URL(string: user.image)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle()) // Découpe l'image en cercle
                        .overlay(Circle().stroke(Color.white, lineWidth: 4)) // Bordure blanche autour de l'image
                        .shadow(radius: 10)
                case .failure:
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 50, height: 50)
            
            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(user.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
        }
        .modifier(ItemModifier())
    }
}
