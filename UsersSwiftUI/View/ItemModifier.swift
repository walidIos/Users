//
//  Untitled.swift
//  testSwiftUI
//
//  Created by walid on 20/3/2025.
//

import SwiftUI

struct ItemModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.orange) // Fond semi-transparent
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
            .padding(.horizontal, 10)
    }
}
