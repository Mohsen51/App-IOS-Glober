//
//  DisplayInfo+ButtonContacte.swift
//  glober
//
//  Created by Antonin Boulnois on 01/05/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct DisplayInfo_ButtonContacte: View {
    
    var data:ProfilResults.Data
    @EnvironmentObject var user:User
    @EnvironmentObject var viewRoot:ViewRouter
    @State var manager = APIFriends()
      
    
    init(data:ProfilResults.Data){
        self.data = data
    }
    var body: some View {
         VStack{
            ProfilResultDisplay(pref: self.data)
               
               
               Button(action:{
                self.manager.get_social_network_info(userId:self.data.UserProfileID, urlparam:  "http://212.47.232.226/api/users/dashboard/friends/contact",token:self.user.token){
        
                                result in
                                  
                                  if result {
                                      self.viewRoot.displayContactInfoPage = true
                                  }
                              }
                          },
                              
                              label:{Text("Contact")}
                          )
             
       }
    }
}

