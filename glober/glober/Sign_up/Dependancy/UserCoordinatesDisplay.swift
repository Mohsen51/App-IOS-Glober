//
//  UserCoordinatesDisplay.swift
//  glober
//
//  Created by Antonin Boulnois on 08/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct UserCoordinatesDisplay: View {
    let listSocialNetwork = ["Facebook","WhatsApp", "Snapchat"]
    
    var socialNetwork:Int
    var identifiant:String
    
    @State var showMessageError = false
    @State var showEmptyFieldAlert = false
    @State var showMessageErrorEmptyField = false
    
    @EnvironmentObject var user:User
    
    
    func AddCoordinatesToList() {
    
        self.showEmptyFieldAlert = false
        let user = UserCoordinates(social_network:self.socialNetwork, identifiant: self.identifiant)
        self.user.contacts.append(user)
    }
    
    func RemoveCoordinatesToList(id:UUID) {
        var count = 0
        while( count < self.user.contacts.count) {
            if self.user.contacts[count].id == id{
                self.user.contacts.remove(at : count )
            }
             count+=1
        }
    }
    
    func SocialNetworkAlreadyExistsInList() -> Bool {
        var count = 0
        while( count < self.user.contacts.count) {
            if self.user.contacts[count].social_network == self.socialNetwork{
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
                if self.SocialNetworkAlreadyExistsInList(){
                    self.showMessageError = true
                }
                else if self.identifiant.isEmpty{
                     self.showMessageErrorEmptyField = true
                }
                else{
                    self.showMessageError = false
                    self.AddCoordinatesToList()
                }
                
               },
               label: { Image(systemName: "plus.circle.fill")
               .resizable()
               .scaledToFit()
                .frame(width:50,height:50)
                .foregroundColor(self.identifiant.isEmpty ? .red : .blue)
                }
               
                
                
            )
                .padding(.bottom,25)
            
            
            if self.showMessageError{
                Text("you have already enterred an identifiant for this social network")
            }
            if self.showMessageErrorEmptyField{
                Text("enter an identifiant")
            }
            
            Text("T'es moyens de contact:")
            .font(.system(size: 25))
           
            // display the social networks with its identifiant
            List(self.user.contacts) {
                UserCoordinates in
                HStack{
                    VStack{
                    Text("\(self.listSocialNetwork[UserCoordinates.social_network])")
                         .font(.system(size: 20, weight: .heavy, design: .default))
                    Text("\(UserCoordinates.identifiant)")
                    // button to delete the social network of the coordinates list
                    
                          
                    }
                    
                    Spacer()
                    
                    Button(
                    action: {
                       self.RemoveCoordinatesToList(id: UserCoordinates.id)
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


