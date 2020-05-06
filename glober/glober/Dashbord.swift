//
//  Dashbord.swift
//  glober
//
//  Created by Antonin Boulnois on 20/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct Dashbord: View {
    
    @State private var selection = 0
    @EnvironmentObject var user:User
    @EnvironmentObject var viewRoot:ViewRouter
   
    
    
    var body: some View {
        VStack{
            
         
           TabView {
            
            MyFriends()
                .tabItem {
                    Image(systemName: "phone.fill")
                    Text("dashbord")
                             }
                Research()
                .tabItem {
                    Image(systemName: "phone.fill")
                    Text("Research")
                             }
                DisplayProfile()
                .tabItem {
                   Image(systemName: "phone.fill")
                   Text("profil")
                 
                 }
           }.onAppear(){
           
            /*self.manager.get_social_network_info(userId:63, urlparam:  "http://212.47.232.226/api/users/dashboard/friends/contact",token:self.user.token){ _ in }*/
            }
        }
    }
}

