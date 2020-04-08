//
//  LocationStyle.swift
//  glober
//
//  Created by Antonin Boulnois on 08/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct CustomStyleTextView: ViewModifier {

    
    func body(content: Content) -> some View {
        content
            .border(Color(red: 236/255, green: 236/255, blue:236/255), width: 5)
            .frame(height:300)
            .padding(.bottom,200)
    }
}

extension View {
    func titleTextView() -> some View {
        self.modifier(CustomStyleTextView())
    }
}

struct CustomStyleButton: ViewModifier {

    
    func body(content: Content) -> some View {
        content
        .padding(.bottom,55)
    }
}

extension View {
    func titleButton() -> some View {
        self.modifier(CustomStyleButton())
    }
}

struct CustomStyleText: ViewModifier {

    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20, weight: .heavy, design: .default))
            .padding(.bottom,25)

    }
}

extension View {
    func titleText() -> some View {
        self.modifier(CustomStyleText())
    }
}

struct CustomStyleText2: ViewModifier {

    
    func body(content: Content) -> some View {
        content
             .font(.system(size: 20, weight: .heavy, design: .default))

    }
}

extension View {
    func titleText2() -> some View {
        self.modifier(CustomStyleText2())
    }
}


struct CustomStylePicker: ViewModifier {

    
    func body(content: Content) -> some View {
        content
             .border(Color(red: 236/255, green: 236/255, blue:236/255), width: 2)
             .cornerRadius(10)
             .frame(height:15)

    }
}

extension View {
    func titlePicker() -> some View {
        self.modifier(CustomStylePicker())
    }
}





