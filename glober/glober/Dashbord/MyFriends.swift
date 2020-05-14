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
                                VStack{
                                    Image("LogoLetter")
                                    .resizable()
                                        .frame(width : 280.0,height : 90)
                                }.offset(x: 0, y: -60);
                                VStack{
                                   Text("Your requests")
                                }
                                VStack{
                                   Text("You don't have  friend yet")
                                }
                           List(self.managerFriends.friendOrRequest!.data){
                               data in
                            
                               DisplayProfilDashbord(pref: data, typeUser: true).environmentObject(self.managerFriends)
                             }
                           }
                       }
                       else if self.managerFriends.noFriendRequests{
                           VStack{
                            VStack{
                                Image("LogoLetter")
                                .resizable()
                                    .frame(width : 280.0,height : 90)
                            }.offset(x: 0, y: -60);
                            VStack{
                                Text("You don't have any requests 😕")
                                .fontWeight(.bold)
                                .font(.system(size: 13))
                            }.offset(x:0,y:-40)
                            
                            VStack{
                                Text("Your friends")
                                    .fontWeight(.bold)
                                    .font(.largeTitle)
                                    //.padding(5)
                            }.padding(.trailing, 115)
 
                           List(self.managerFriends.friendOrRequest!.data){
                             data in
                               DisplayProfilDashbord(pref: data, typeUser: false).environmentObject(self.managerFriends)
                           }
                           }
                           
                       }
                       else{
                           VStack{
                            VStack{
                                Image("LogoLetter")
                                .resizable()
                                    .frame(width : 280.0,height : 90)
                            }.offset(x: 0, y: -60);
                            VStack{
                                VStack{
                                  Text("Your requests")
                                    .fontWeight(.bold)
                                    .font(.largeTitle)
                                    //.padding(5)
                                }.padding(.trailing, 100)
                                 List(self.managerFriends.data!.Requests){
                                   data in
                                
                                     DisplayProfilDashbord(pref: data, typeUser: true).environmentObject(self.managerFriends)
                                 }
                                VStack{
                                    Text("Your friends")
                                        .fontWeight(.bold)
                                        .font(.largeTitle)
                                        //.padding(5)
                                }.padding(.trailing, 115)
                                List(self.managerFriends.data!.Friends){
                                    data in
                                
                                    DisplayProfilDashbord(pref: data, typeUser: false).environmentObject(self.managerFriends)
                                }

                            }.padding(.top,-55)
                                                       
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

