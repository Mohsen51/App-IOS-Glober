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
    
    
    func returnIndexGivenUUIDFromJustFriend(identifiant:UUID) -> Int{
        for var i in (0..<self.managerFriends.friendOrRequest!.data.count){
            if (self.managerFriends.friendOrRequest!.data[i].id != nil){
                return i
            }
            i+=1
        }
        return -1
    }
    
    func returnIndexGivenUUIDFromFriend(identifiant:UUID) -> Int{
        for var i in (0..<(self.managerFriends.data?.Requests.count)!){
            if (self.managerFriends.data?.Requests[i].id != nil){
                return i
            }
            i+=1
        }
        return -1
    }
    
    func removeInvitationFromInvitationList(){
       var index = self.returnIndexGivenUUIDFromJustFriend(identifiant: self.data.id!)
       if index == -1 {
           index =  self.returnIndexGivenUUIDFromFriend(identifiant: self.data.id!)
           self.managerFriends.data?.Requests.remove(at: index)
       }
       else{
           self.managerFriends.friendOrRequest!.data.remove(at: index)
       }
    }
    
    var body: some View {
      
        VStack{
        Button(
            action: {
             withAnimation {
                // no friends
                if self.typeUser == false {
                    self.manager.get_extra_info_user(userid:self.data.UserProfileID!,token: self.user.token, urlparam: "http://212.47.232.226/api/users/dashboard/friends/profile"){
                    result in
                    
                    if result {
                         self.showExtraInfoUser.toggle()
                    }
                }
                }
                //friends
                else{
                    self.manager.get_extra_info_user(userid:self.data.UserProfileID!,token: self.user.token, urlparam: "http://212.47.232.226/api/users/dashboard/friendsRequest/profile"){
                                       result in
                                       
                                       if result {
                                            self.showExtraInfoUser.toggle()
                                       }
                                   }
                }
            
             }
            },
            label: {
               VStack{
                Banner( name: self.data.FirstName, date: self.data.DateOfBirth, country:self.data.Country,gender:self.data.Gender,university: self.data.University ?? "")
                
               }
               }
           
            ).sheet(isPresented:self.$showExtraInfoUser ){
                // Requested Friendship
                if self.typeUser {
                    VStack{
                        DisplayProfileGenerale(data: self.manager.data!.data[0], langues: self.manager.data!.language,note: (self.manager.data!.note?[0])!)
                        
                        HStack{
                            Button(action:{
                                self.managerContact.get_accept_request(bool:1,userId:self.data.UserProfileID!, urlparam:  "http://212.47.232.226/api/users/dashboard/friendsRequest/profile/response",token:self.user.token)
                                
                                // remove from request list without refreshing the page
                                //self.removeInvitationFromInvitationList()
                                //add to the expected list without refreshing the page
                                //self.managerFriends.data?.Friends.append(self.data)
                                          },
                                              
                                              label:{Text("Accept")}
                                          )
                            
                            Button(action:{
                                self.managerContact.get_accept_request(bool:0,userId:self.data.UserProfileID!, urlparam:  "http://212.47.232.226/api/users/dashboard/friendsRequest/profile/response",token:self.user.token)
                                // remove from request list without refreshing the page
                                //self.removeInvitationFromInvitationList()
                                
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
                        self.managerFriends.get_social_network_info(userId:self.data.UserProfileID!, urlparam:  "http://212.47.232.226/api/users/dashboard/friends/contact",token:self.user.token){
                    
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

