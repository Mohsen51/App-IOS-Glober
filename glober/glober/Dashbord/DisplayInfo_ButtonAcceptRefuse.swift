//
//  DisplayInfo_ButtonAcceptRefuse.swift
//  glober
//
//  Created by Antonin Boulnois on 01/05/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct DisplayInfo_ButtonAcceptRefuse: View {
    var data:ProfilResults.Data
    @EnvironmentObject var user:User
    @EnvironmentObject var viewRoot:ViewRouter
    @State var manager = APIRequestsContact()
      
    
    init(data:ProfilResults.Data){
        self.data = data
    }
    var body: some View {
         VStack{
            ProfilResultDisplay(pref: self.data)
               
               
               Button(action:{
                self.manager.get_accept_request(bool:1,userId:self.data.UserId, urlparam:  "http://212.47.232.226/api/users/dashboard/friends/contact",token:self.user.token)
                          },
                              
                              label:{Text("Accept")}
                          )
            
            Button(action:{
                self.manager.get_accept_request(bool:0,userId:self.data.UserId, urlparam:  "http://212.47.232.226/api/users/dashboard/friends/contact",token:self.user.token)
                                     },
                                         
                                         label:{Text("Refuse")}
                                     )
             
       }
    }
}


