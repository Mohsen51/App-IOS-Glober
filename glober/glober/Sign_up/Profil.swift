//
//  Profil.swift
//  glober
//
//  Created by Antonin Boulnois on 08/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct Profil: View {
    
   @EnvironmentObject var user:User
   var genders = ["Man", "Woman", "Prefer not to say"]
   let countryList = ["France","Espagne"]

   @State private var showDatePicker = false
   @State private var showMessageError = false
   @State private var showListPicker = false
   @State private var selectedCountry = 0
    

    
  var dateFormatter: DateFormatter {
              let formatter = DateFormatter()
              formatter.dateStyle = .long
              return formatter
          }


   
   func CheckIfFilled() -> Bool {
       
      
       if user.name == "" {
           return true
       }
           
       else if user.email == "" {
           return true
       }
       else if user.school == ""{
        return true
        }
       else if self.user.languages.count == 0 {
        return true
        }
       else if self.user.password == ""{
        return true
        }
        
       return false
   }
    
   
    
    
    var body: some View {
         NavigationView{
               ScrollView {
                   VStack{
                    HStack{
                        SelectImage()
                        
                        Toggle(isOn: $user.status){
                               if self.user.status{
                                      Text("Welcomer")
                                       .font(.custom("Arial", size: 30))
                                  }
                                  else{
                                      Text("Globber")
                                      .font(.custom("Arial", size: 30))
                            }
                      }
                }
                  TextField("Name",text : $user.name)
                    .padding()
                    .roundedGrayBorder()
                        
                  TextField("Email",text : $user.email)
                    .padding()
                    .roundedGrayBorder()
          
                  SecureField("Password",text : $user.password)
                    .padding()
                    .roundedGrayBorder()
          
                  TextField("University",text : $user.school)
                    .padding()
                    .roundedGrayBorder()
                    .padding(.bottom,30)
                    
                    
                    Button(
                         action: {
                              withAnimation {
                              self.showListPicker.toggle()
                              }
                          },
                         label: {
                            HStack(){
                                VStack(alignment: .leading){
                                    Text("Nationality")
                                     .font(.system(size: 15))
                                        .foregroundColor(Color(.black))
                                    Text("\(self.countryList[selectedCountry])")
                                    .foregroundColor(Color(.black))
                                    Spacer()
                                }.padding(10)
                           
                                Spacer()
                            }
                         .modifier(CustomStylePicker())
                
                
                    }
     
                 )
                    .padding(.bottom,30)
             
                  if self.showListPicker{
                      Picker(selection: $selectedCountry, label: Text("")) {
                          ForEach(0 ..< countryList.count) {
                              Text(self.countryList[$0])

                          }
                      }
                  }
                    
                  Picker(selection: $user.gender, label: Text(" ")) {
                     ForEach(0..<genders.count) { index in
                         Text(self.genders[index]).tag(index)
                     }
                 }.pickerStyle(SegmentedPickerStyle())
                     .padding(.bottom,25)
                    
                    Button(
                      action: {
                       withAnimation {
                       self.showDatePicker.toggle()
                       }
                      },
                      label: {
                        HStack(){
                             VStack(alignment: .leading){
                                 Text("Birth date")
                                  .font(.system(size: 15))
                                     .foregroundColor(Color(.black))
                                  Text("\(user.dateOfBirth, formatter: dateFormatter)")
                                 .foregroundColor(Color(.black))
                                 Spacer()
                             }.padding(10)
                        
                             Spacer()
                         }
                         .modifier(CustomStylePicker())
                              }
                       )
                       
                          .padding(.bottom,30)
                    
                    if self.showDatePicker {
                       DatePicker("", selection: $user.dateOfBirth, in:...Date(),displayedComponents: .date)
                   }

                }
                Langues()
                .padding(.top,30)
                
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
                       
                       
                
            .padding(15)
            }
            .navigationBarItems(trailing:
                  HStack {
                   
                   NavigationLink(destination: SocialMedia() ){
                          
                          Text("Next").multilineTextAlignment(.trailing)
                   }.disabled(CheckIfFilled())
                  }
              )
        
    }
}

struct Profil_Previews: PreviewProvider {
    static var previews: some View {
        Profil()
    }
}
