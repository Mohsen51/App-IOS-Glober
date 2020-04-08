//
//  PreferenceStyle.swift
//  glober
//
//  Created by Antonin Boulnois on 08/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct CustomStyleVStack: ViewModifier {

    
    func body(content: Content) -> some View {
        content
           .frame(maxWidth:155)
           .clipped()
           .border(Color.red)
    }
}

extension View {
    func titleVstacl() -> some View {
        self.modifier(CustomStyleVStack())
    }
}
