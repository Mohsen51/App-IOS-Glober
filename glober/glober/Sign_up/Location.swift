//
//  Location.swift
//  glober
//
//  Created by Antonin Boulnois on 08/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI
import TextView

struct Location: View {
    
    @EnvironmentObject var user:User
    @EnvironmentObject var token:Token
    
    @State private var isEditing = false
    @State private var showListPicker = false
    @State private var selected = 0
    
    let city = ["Paris","Nantes","Lille"]
    
    
    
    var body: some View {
         NavigationView{
             ScrollView{
                Spacer()
                    .frame(height: 30)
                VStack{
                    Image("LogoLetter")
                    .resizable()
                        .frame(width : 280.0,height : 90)
                    Spacer()
                    .frame(height: 30)
                    Text("Please enter your city :")
                        .modifier(CustomStyleText3())
                    Spacer()
                        .frame(height: 20)
                    Button(
                        action: {
                            withAnimation {
                                self.showListPicker.toggle()
                            }
                        },
                        label: {
                            HStack(){
                                VStack(alignment: .leading){
                                    Text("\(self.city[self.user.city])")
                                        .foregroundColor(Color(.black))
                                    Spacer()
                           }.padding(10)
                      
                           Spacer()
                            }
                             .modifier(CustomStylePicker())
                        }
                    )
                     .modifier(CustomStyleButton())
                   
                    
                    if self.showListPicker{
                        Picker(selection: $user.city , label: Text("")) {
                       ForEach(0..<city.count) { index in
                           Text(self.city[index]).tag(index)
                                     }
                                 }
                    }
                };VStack{
                    
                    Text("Describe your personnality in few words 😉")
                        .modifier(CustomStyleText3())
                        .multilineTextAlignment(.center)
                    
                    TextView(text: $user.description, isEditing: $isEditing)
                    .modifier(CustomStyleTextView())
                }
                    
                    
                    
                
            }
             .navigationBarTitle(Text("Location & Description"), displayMode: .inline)
            .navigationBarItems(trailing:
                    NavigationLink(destination:  Preferences().environmentObject(self.user)){
                                   Text("Next").multilineTextAlignment(.trailing)
                               }
                        )
        }
        
    }
}

struct Location_Previews: PreviewProvider {
    static var previews: some View {
        Location()
    }
}
