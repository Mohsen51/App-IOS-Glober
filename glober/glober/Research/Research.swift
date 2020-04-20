//
//  Research.swift
//  glober
//
//  Created by Antonin Boulnois on 16/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct Research: View {
    
    @State private var location = 0
    @State private var showListPicker = false
    @State private var displayResults = false
    @State private var fetchingData = false
    @State var manager = APIResearch()
    @EnvironmentObject var token:Token
    private let city = ["Paris","Nantes","Lille"]
    
    init(){
        
    }
      
    var body: some View {
        
        
        VStack{
           
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
                             Text("\(self.city[location])")
                             
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
               Picker(selection: $location, label: Text(" ")) {
                   ForEach(0..<city.count) { index in
                       Text(self.city[index]).tag(index)
                   }
               }
           }
            
           
            Button(action: {
                //self.token.token = "aaaaa"
                self.manager.get_profils_from_city(city:self.city[self.location], urlparam: "http://212.47.232.226/api/users/dashboard/friends")
                self.displayResults = true
                
            }, label: { Text("Submit")
            })
            
            NavigationLink(destination: Results(result:self.manager.data), isActive: self.$displayResults){
                           Text("")
                       }
            
               
            
          
            }
         
        
    }
}

struct Research_Previews: PreviewProvider {
    static var previews: some View {
        Research()
    }
}
