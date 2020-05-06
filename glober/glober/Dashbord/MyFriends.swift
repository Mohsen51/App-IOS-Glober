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
    @State var manager2 = APIRequestsContact()
  
    
    
    var body: some View {
        VStack{
            
            //Friends
         NavigationView{
            
            if (!self.loading ){
            List(self.manager.data){
                  data in
                Text("\(1)")
                //DisplayInfo_ButtonContacte(data: data)
                }
            }
            Text("")
            .onAppear(){
                self.manager.get_friends(urlparam: "http://212.47.232.226/api/users/dashboard/friends", token: self.user.token){result in  if result{ self.loading = false}}
              
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

