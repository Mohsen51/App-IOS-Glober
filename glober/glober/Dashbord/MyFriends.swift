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
    @State var managerFriends = APIFriends()
   
  
    
    
    var body: some View {
        VStack{
            
            //Friends
         NavigationView{
            VStack{
                   if (!self.loading ){
                 
                       if self.managerFriends.noFriendsNoRequests{
                        VStack{
                            Image("LogoLetter")
                            .resizable()
                                .frame(width : 280.0,height : 90)
                        }.offset(x: 0, y: -150);
                        VStack{
                            Text("Sorry 😕")
                                .fontWeight(.bold)
                                .font(.largeTitle)
                                .padding(5)
                            
                            Text("You don't have friends/requests yet")
                                .padding(.bottom,180)
                            
                            Text("Go in research to find friends arround you 😉")
                                .foregroundColor(Color.gray)
                            Text("👇🏻")
                                .font(.largeTitle)
                            
                        }
                       }
                       else if self.managerFriends.noFriends {
                            VStack{
                           Text("You don't have  friend yet")
                           Text("Your requests")
                           List(self.managerFriends.friendOrRequest!.data){
                               data in
                            
                               DisplayProfilDashbord(pref: data, typeUser: true).environmentObject(self.managerFriends)
                             }
                           }
                       }
                       else if self.managerFriends.noFriendRequests{
                           VStack{
                           Text("You don't have requests")
                           Text("Your friends")
                           List(self.managerFriends.friendOrRequest!.data){
                             data in
                               DisplayProfilDashbord(pref: data, typeUser: false).environmentObject(self.managerFriends)
                           }
                           }
                           
                       }
                       else{
                           VStack{
                           Text("Your friends")
                           List(self.managerFriends.data!.Friends){
                               data in
                            
                               DisplayProfilDashbord(pref: data, typeUser: false).environmentObject(self.managerFriends)
                             }
                           Text("Your requests")
                           List(self.managerFriends.data!.Requests){
                             data in
                          
                               DisplayProfilDashbord(pref: data, typeUser: true).environmentObject(self.managerFriends)
                           }
                           }
                       }
                   }
                   
                  
                   Text("")
                   .onAppear(){
                       self.viewRoot.displayResearch = false
                       self.managerFriends.get_friends(urlparam: "http://212.47.232.226/api/users/dashboard/friends", token: self.user.token){result in  if result{ self.loading = false
                           
                           }}
                       
                      
                     
                   }
                   
                  
                }
            }

           
        }
    }
}

