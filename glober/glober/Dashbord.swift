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
    
    @State var manager = APIFriends()
    @State var manager2 = APIRequestsContact()
    
    var body: some View {
        VStack{
            
         
           TabView {
            
            //MyFriends(friends: self.manager.data,requestFriends:self.manager2.data)
            Text("aaaa")
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
            /*self.manager.get_friends(urlparam: "http://212.47.232.226/api/users/api/users/dashboard/friends", token: self.user.token){_ in }
            self.manager2.get_requests_contact(urlparam: "http://212.47.232.226/api/users/api/users/dashboard/friendsRequest/profile", token: self.user.token){_ in}*/
            }
        }
    }
}

