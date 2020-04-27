//
//  Langues.swift
//  glober
//
//  Created by Antonin Boulnois on 08/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI



struct Langues: View {
    
    @State private var showListPicker = false
    @EnvironmentObject var user:User
    @State private var selectedCountry = 0
    
    let languagesList = Languages.returnLanguages()
    
    var body: some View {
        VStack{
                
            Button(
                 action: {
                  withAnimation {
                   self.showListPicker.toggle()
                 
                  }
                 },
                 label: {
                   HStack(){
                        VStack(alignment: .leading){
                            Text("Languages")
                              .foregroundColor(Color(.black))
                               .font(.system(size: 15))
                            Text("\(languagesList[selectedCountry])")
                             
                                .foregroundColor(Color(.black))
                            
                            Spacer()
                        }.padding(10)
                   
                        Spacer()
                    }
                  .modifier(CustomStyleButton())
                  
                       
                   }
               
        )
         .padding(.bottom,25)
            
    
           if self.showListPicker{
               Picker(selection: $selectedCountry, label: Text("")) {
                   ForEach(0 ..< languagesList.count) {
                       Text(self.languagesList[$0])

                   }
               }
           }
            
            UserLanguagesDisplay(country: self.languagesList[self.selectedCountry])
                .frame(height:300)
            
        }
        
    }
}

struct Langues_Previews: PreviewProvider {
    static var previews: some View {
        Langues()
    }
}
