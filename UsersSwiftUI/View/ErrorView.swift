//
//  ErrorView.swift
//  testSwiftUI
//
//  Created by walid on 21/3/2025.
//

import SwiftUI

struct ErrorView: View {
    let message: String
    let retryAction: () -> Void

    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.red)

            Text(message)
                .font(.headline)
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
                .padding()

            Button("Réessayer") {
                retryAction()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .modifier(ErrorModifier()) // Appliquer le ViewModifier
    }
}
