//
//  Untitled.swift
//  testSwiftUI
//
//  Created by walid on 20/3/2025.
//

import SwiftUI

extension View {
    func withBackButton() -> some View {
        self
            .modifier(BackButtonModifier()) // Utiliser le ViewModifier
    }
}
