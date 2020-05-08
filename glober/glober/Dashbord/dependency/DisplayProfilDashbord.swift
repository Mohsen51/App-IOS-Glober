//
//  DisplayProfilDashbord.swift
//  glober
//
//  Created by Antonin Boulnois on 08/05/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct DisplayProfilDashbord: View {
    
    var data:DataUser
    var typeUser:Bool // true -> Friend  false -> Requested Friendship
    @EnvironmentObject var user:User
    
    init(pref:DataUser,typeUser:Bool){
        self.data = pref
        self.typeUser = typeUser
    }
     @EnvironmentObject var viewRoot:ViewRouter
    @State var showExtraInfoUser = false
    @State var manager = APIResearchExtraInfoUser()
    @State var managerContact = APIRequestsContact()
     @State var managerFriends = APIFriends()
    
    var body: some View {
      
        VStack{
        Button(
            action: {
             withAnimation {
                
                self.manager.get_extra_info_user(userid:self.data.UserProfileID,token: self.user.token, urlparam: "http://212.47.232.226/api/users/dashboard/friends/profile"){
                    result in
                    
                    if result {
                         self.showExtraInfoUser.toggle()
                    }
                }
            
             }
            },
            label: {
               VStack{
                Banner(image: "iu", name: self.data.FirstName, date: self.data.DateOfBirth, country:self.data.Country)
                
               }
               }
           
            ).sheet(isPresented:self.$showExtraInfoUser ){
                // Requested Friendship
                if self.typeUser {
                    VStack{
                        DisplayProfileGenerale(data: self.manager.data!.data[0], langues: self.manager.data!.language,note: (self.manager.data!.note?[0])!)
                        
                        HStack{
                            Button(action:{
                                self.managerContact.get_accept_request(bool:1,userId:self.data.UserProfileID, urlparam:  "http://212.47.232.226/api/users/dashboard/friendsRequest/profile/response",token:self.user.token)
                                          },
                                              
                                              label:{Text("Accept")}
                                          )
                            
                            Button(action:{
                                self.managerContact.get_accept_request(bool:0,userId:self.data.UserProfileID, urlparam:  "http://212.47.232.226/api/users/dashboard/friendsRequest/profile/response",token:self.user.token)
                                                     },
                                                         
                                                         label:{Text("Refuse")}
                            )
                        }
                    }
                }
                // Friends
                else{
                    if !self.viewRoot.displayContactInfoPage{
                    VStack{
                        DisplayProfileGenerale(data: self.manager.data!.data[0], langues: self.manager.data!.language,note: (self.manager.data!.note?[0])!)
                        
                     Button(action:{
                            self.managerFriends.get_social_network_info(userId:self.data.UserProfileID, urlparam:  "http://212.47.232.226/api/users/dashboard/friends/contact",token:self.user.token){
                    
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
                else{
                        ContactInfo(result: self.managerFriends.contactInfo,userinfo:self.manager.data!.data[0]).onDisappear(){
                            self.viewRoot.displayContactInfoPage = false
                        }
                }
                }
                           }
             
                .padding(.bottom,30)
      
        
        
        
        }
        
        
      
    }
}

