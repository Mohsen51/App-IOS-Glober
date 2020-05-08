//
//  ProfilResultDisplay.swift
//  glober
//
//  Created by Antonin Boulnois on 20/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct ProfilResultDisplay: View {
    
    var data:ProfilResults.Data
    @EnvironmentObject var user:User
    
    init(pref:ProfilResults.Data){
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
                
                HStack{
                DisplayPreference(imageName: "iu",levelPreference: self.data.Bar)
                DisplayPreference(imageName: "iu",levelPreference: self.data.Blabla)
                DisplayPreference(imageName: "iu",levelPreference: self.data.Museum)
                DisplayPreference(imageName: "iu",levelPreference: self.data.Party)
                DisplayPreference(imageName: "iu",levelPreference: self.data.Bar)
                }
                
               
                
               }
               }
           
             ) .sheet(isPresented:self.$viewRoot.displayContactPage ){
                Contacter(data: self.data, userid:self.data.UserProfileID,token:self.user.token).environmentObject(self.viewRoot)
                               }
             
                .padding(.bottom,30)
         if self.showExtraInfoUser {
                            
            ExtraInfoUser(data: self.manager.data!,userid:self.data.UserProfileID)
                        }
        
        
        }
        
        
      
    }
}

