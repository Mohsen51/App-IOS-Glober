//
//  SocialMedia.swift
//  glober
//
//  Created by Antonin Boulnois on 08/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct SocialMedia: View {
    
    let list = ["Facebook","phone", "Snapchat"]
    
    @State private var showListPicker = false
    @State private var selectedNetwork = 0
    @State private var identifiantTemp:String = ""
    @EnvironmentObject var user:User
    
    func CheckIfFieldNotEmpty() -> Bool {
        if self.identifiantTemp.isEmpty{
            return true
        }
        return false
    }
    func CheckIfFilled() -> Bool {
        
        if user.contacts.isEmpty {
            return true
        }
        return false
    }
    
    var body: some View {
        
        NavigationView {
           // ScrollView{
                
                VStack{
                
                    Text("On te contacte par:")
                    .font(.system(size: 25))
                        .padding(.bottom,25)
                    
                    Button(
                          action: {
                           withAnimation {
                            self.showListPicker.toggle()
                            print(1)
                           }
                          },
                          label: {
                            HStack(){
                                 VStack(alignment: .leading){
                                    Text("\(self.list[self.selectedNetwork] )")
                                      
                                         .foregroundColor(Color(.black))
                                     
                                     Spacer()
                                 }.padding(10)
                            
                                 Spacer()
                             }
                            .border(Color(red: 236/255, green: 236/255, blue:236/255), width: 2)
                                                           .cornerRadius(10)
                                                              .frame(height:15)
                           
                                
                            }
                        
                           )
                       
                              .padding(.bottom,30)
                        
                
                   
                    if self.showListPicker{
                        Picker(selection: $selectedNetwork, label: Text("")) {
                            ForEach(0 ..< list.count) {
                                Text(self.list[$0])

                            }
                        }
                    }
                        
                    TextField("identifiant",text : self.$identifiantTemp)
                    .padding()
                    .roundedGrayBorder()
                    
                    UserCoordinatesDisplay(socialNetwork: self.selectedNetwork, identifiant: self.identifiantTemp)
                        
                    
                  
                        
                }
               
                   
            }
       // }
            .navigationBarTitle("Contact")
             .navigationBarItems(trailing:
                 HStack {
                  NavigationLink(destination: Submit()){
                         Text("Send").multilineTextAlignment(.trailing)
                     }
                   
                 }
         )
    
}
    
    
  
}


struct SocialMedia_Previews: PreviewProvider {
    static var previews: some View {
        SocialMedia()
    }
}
