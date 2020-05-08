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
    @State private var loading:Bool = true
    @State var manager = APIFriends()
   
  
    
    
    var body: some View {
        VStack{
            
            //Friends
         NavigationView{
            
            if (!self.loading ){
          
                if self.manager.noFriendsNoRequests{
                    Text("You don't have  friends/requests yet")
                }
                if self.manager.noFriends {
                     VStack{
                    Text("You don't have  friend yet")
                    Text("Your requests")
                    List(self.manager.friendOrRequest!.data){
                        data in
                     
                        DisplayProfilDashbord(pref: data, typeUser: true)
                      }
                    }
                }
                else if self.manager.noFriendRequests{
                    VStack{
                    Text("You don't have requests")
                    Text("Your friends")
                    List(self.manager.friendOrRequest!.data){
                      data in
                        DisplayProfilDashbord(pref: data, typeUser: false)
                    }
                    }
                    
                }
                else{
                    VStack{
                    List(self.manager.data!.Friends){
                        data in
                     
                        DisplayProfilDashbord(pref: data, typeUser: false)
                      }
                    
                    List(self.manager.data!.Requests){
                      data in
                   
                        DisplayProfilDashbord(pref: data, typeUser: true)
                    }
                    }
                }
            }
            
           
            Text("")
            .onAppear(){
                self.viewRoot.displayResearch = false
                self.manager.get_friends(urlparam: "http://212.47.232.226/api/users/dashboard/friends", token: self.user.token){result in  if result{ self.loading = false
                    
                    }}
                
               
              
            }
            
           
         }
           
        }
    }
}

