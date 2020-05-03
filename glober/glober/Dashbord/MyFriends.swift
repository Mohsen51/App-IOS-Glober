//
//  MyFriends.swift
//  glober
//
//  Created by Antonin Boulnois on 01/05/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct MyFriends: View {
    
  
    @EnvironmentObject var user:User
    @EnvironmentObject var viewRoot:ViewRouter
    @State var manager = APIFriends()
    
    var friends:[ProfilResults.Data]
    var requestFriends:[ProfilResults.Data]
    
    init(friends:[ProfilResults.Data],requestFriends:[ProfilResults.Data]){
        self.friends = friends
        self.requestFriends = requestFriends
    }
    
    var body: some View {
        VStack{
            
            //Friends
         NavigationView{
            List(self.friends){
                  data in
               
                DisplayInfo_ButtonContacte(data: data)
            }
            
            //Requests Friends
            List(self.requestFriends){
                data in
                
                DisplayInfo_ButtonAcceptRefuse(data:data)
               
            
            }
            
            }
            .navigationBarItems(trailing:
                NavigationLink(destination: ContactInfo(result:self.manager.contactInfo),isActive: self.$viewRoot.displayContactInfoPage){
                               Text(" ").multilineTextAlignment(.trailing)
                           }
                    )
        }
    }
}

