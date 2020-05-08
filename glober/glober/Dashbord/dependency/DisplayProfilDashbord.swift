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
    @EnvironmentObject var user:User
    
    init(pref:DataUser){
        self.data = pref
    }
     @EnvironmentObject var viewRoot:ViewRouter
    @State var showExtraInfoUser = false
    @State var manager = APIResearchExtraInfoUser()
    
    var body: some View {
      
        VStack{
        Button(
            action: {
             withAnimation {
                
                self.manager.get_extra_info_user(userid:self.data.UserProfileID,token: self.user.token, urlparam: "http://212.47.232.226/api/users/search/profile"){
                    result in
                    
                    if result {
                         self.showExtraInfoUser.toggle()
                    }
                }
            
             }
            },
            label: {
               VStack{
                HStack{
                Image("iu")
                    .resizable()
                                  .scaledToFit()
                    .frame(width:100,height:100)
                    VStack{
                Text("\(self.data.FirstName)")
                   
                Text("\(self.data.Country )")
                }
                   
                Text("\(String(self.data.DateOfBirth)+"year old")")
                
                }
                
               
                
               
                
               }
               }
           
             ) 
             
                .padding(.bottom,30)
         if self.showExtraInfoUser {
                            
            ExtraInfoUser(data: self.manager.data!,userid:self.data.UserProfileID)
        }
        
        
        }
        
        
      
    }
}

