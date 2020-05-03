//
//  ProfilStyle.swift
//  glober
//
//  Created by Antonin Boulnois on 08/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct RoundedGrayBorder: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: 50))
        .overlay(
            RoundedRectangle(cornerRadius: 50)
                .stroke(Color.black, lineWidth: 1)
        )
    }
}

extension View {
    func roundedGrayBorder() -> some View {
        self.modifier(RoundedGrayBorder())
    }
}
