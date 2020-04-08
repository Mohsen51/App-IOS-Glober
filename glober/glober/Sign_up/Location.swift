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
    
    @State private var isEditing = false
    @State private var showListPicker = false
    @State private var selected = 0
    
    let city = ["Paris","Nantes","Lille"]
    
    
    var body: some View {
         NavigationView{
             ScrollView{
                VStack{
                    Text("Location:")
                        .modifier(CustomStyleText())
                    
                    Button(
                        action: {
                            withAnimation {
                                self.showListPicker.toggle()
                            }
                        },
                        label: {
                            HStack(){
                                VStack(alignment: .leading){
                                    Text("\(self.city[self.selected])")
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
                    Picker(selection: $selected, label: Text("")) {
                       ForEach(0..<city.count) { index in
                           Text(self.city[index]).tag(index)
                                     }
                                 }
                    }
                    
                    Text("Who are you ?")
                    .modifier(CustomStyleText2())
                    
                    TextView(text: $user.description, isEditing: $isEditing)
                    .modifier(CustomStyleTextView())
                    
                }
            }
            .navigationBarTitle(Text("Home"), displayMode: .inline)
            .navigationBarItems(trailing:
                    NavigationLink(destination: Preferences()){
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
