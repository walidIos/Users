//
//  ErrorModifier.swift
//  testSwiftUI
//
//  Created by walid on 21/3/2025.
//

import SwiftUI

struct ErrorModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.orange) // Fond semi-transparent
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}
