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
    @State private var displayErrorLocation = false
    @State var manager = APIResearch()
    @EnvironmentObject var viewRoot:ViewRouter
    @EnvironmentObject var user:User
    private let city = ["Paris","Nantes","Lille"]
    
    init(){
       
    }
      
    var body: some View {
        
        NavigationView{
        VStack{
           
            VStack{
                Image("LogoLetter")
                .resizable()
                    .frame(width : 280.0,height : 90)
            }.offset(x: 0, y: -240);
            
            VStack{
                Text("Choose your actual country 📍")
                .font(.system(size: 16))
                .fontWeight(.bold)
                
                
            }.offset(x:0,y:-100)
           
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
            }
            
            VStack{
                ZStack{
                            Button(action: {
                                self.manager.get_profils_from_city(city:self.city[self.location], urlparam: "http://212.47.232.226/api/users/search",token:self.user.token){
                                    
                                    result in
                                    
                                    if result {
                                        
                                        if !self.manager.errorLocation {
                                            self.viewRoot.displayResearch = true
                                            self.displayErrorLocation = false
                                        }
                                        else{

                                            self.displayErrorLocation = true
                                                                   }
                                    }
                                    
                                }
                    
                                
                            }) {
                                Rectangle()
                                .frame(width: 160, height: 40, alignment: .center)
                                .cornerRadius(50)
                                .foregroundColor(.blue)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.black, lineWidth: 2)
                                )
                            }
                            Text("Research")
                    
                }
            }.padding(.top,20)

            
            if self.displayErrorLocation {
                                 Text("no one at this location")
                                 }
            
         
            
            
               
            
          
            }
            .onAppear{
                self.viewRoot.displayResearch = false
            }
            .onDisappear(){
                self.viewRoot.displayResearch = false
            }
            
            .navigationBarItems(trailing:
                        NavigationLink(destination: Results(result:self.manager.data),isActive: self.$viewRoot.displayResearch){
                                           Text(" ").multilineTextAlignment(.trailing)
                                       }
                                )
        
        }
       
    }
}

struct Research_Previews: PreviewProvider {
    static var previews: some View {
        Research()
    }
}
