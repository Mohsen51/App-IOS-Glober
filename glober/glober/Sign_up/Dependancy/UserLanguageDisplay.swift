//
//  UserLanguageDisplay.swift
//  glober
//
//  Created by Antonin Boulnois on 08/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI


struct UserLanguagesDisplay: View {
    
   
    var country:String
   
    
    @State var showMessageError = false
    
    @EnvironmentObject var user:User
    
    func checkRedundancy(){
        
    }
    func AddLanguageToList() {
        
        let user = UserLanguages( country: self.country)
        
        self.user.languages.append(user)
    }
    
    func RemoveLanguageToList(id:UUID) {
        var count = 0
        while( count < self.user.languages.count) {
            if self.user.languages[count].id == id{
                self.user.languages.remove(at : count )
                count+=1
            }
        }
    }
    
    func LanguageAlreadyExistsInList() -> Bool {
        var count = 0
        while( count < self.user.languages.count) {
            if (self.user.languages[count].country == self.country){
                return true
               
            }
            count+=1
        }
        return false
    }
    
    var body: some View {
        
       
        VStack{
      
            // button to add the social network to the list
            Button(
               action: {
                if self.LanguageAlreadyExistsInList(){
                    self.showMessageError = true
                }
                else{
                    self.showMessageError = false
                    self.AddLanguageToList()
                }
                
               },
             label: { Image(systemName: "plus.circle.fill")
               .resizable()
               .scaledToFit()
                .frame(width:50,height:50)
                }
                
            )
            
            if self.showMessageError{
                Text("you have already enterred an identifiant for this social network")
            }
            
           
            // display the social networks with its identifiant
            List(self.user.languages) {
                UserLanguages in
                HStack{
                    VStack{
                    Text("\(UserLanguages.country)")
                         .font(.system(size: 20, weight: .heavy, design: .default))
                    
                    }
                    
                    Spacer()
                    
                    Button(
                    action: {
                       self.RemoveLanguageToList(id: UserLanguages.id)
                    },
                    label: { Image(systemName: "clear.fill")
                                                    .resizable()
                                                    .scaledToFit()
                        .frame(width:25,height:25)
                            
                    }
                    
                     
                    )
                }
            }
        
        }
        
       
    }
}


