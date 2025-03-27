//
//  BackButtonModifier.swift
//  testSwiftUI
//
//  Created by walid on 20/3/2025.
//

import SwiftUI

struct BackButtonModifier: ViewModifier {
    @Environment(\.dismiss) var dismiss

    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true) // Cache le bouton par défaut
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss() // Retour en arrière
                    }) {
                        HStack {
                            Image(systemName: "chevron.left") // Icône de retour
                                .foregroundColor(.blue)
                            Text("Retour")
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
    }
}
