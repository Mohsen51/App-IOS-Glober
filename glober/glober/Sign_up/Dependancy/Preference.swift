//
//  Preference.swift
//  glober
//
//  Created by Antonin Boulnois on 08/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct Preference: View{
    
    @EnvironmentObject var user:User
    @State private var showPicker = false
    
    let preference = ["👍","👎","😍"]
    let choice:Int
    
    var imageName:String
    
    init(choice:Int,imageName:String){
        self.choice = choice
        self.imageName = imageName
    }
    
    var body: some View{
        
        VStack{
            
            Button(
                action: {
                 withAnimation {
                  self.showPicker.toggle()
                 }
                },
                label: {
                    ZStack{
                        
                        Image(self.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width:150,height:150)
                        
                         Text(preference[Int(user.preferences[self.choice])])
                         .font(.custom("Arial", size: 50))
                        
                    }
                      
                }
              
            ).buttonStyle(PlainButtonStyle())
            
            if self.showPicker == true {
                Picker(selection: $user.preferences[self.choice], label: Text("")) {
                ForEach(0..<preference.count) { index in
                    Text(self.preference[index]).tag(index)
                              }
                          }
            }
            
        }
        .modifier(CustomStyleVStack())
    }
}
