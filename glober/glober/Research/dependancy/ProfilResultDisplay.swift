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
                
                Banner(image: "iu", name: self.data.FirstName, date: self.data.DateOfBirth, country:self.data.Country,gender:self.data.Gender,university: self.data.University ?? "")
                
                HStack{
                DisplayPreference(imageName: "iu",levelPreference: self.data.Bar,width: 50,height: 50,sizeThumb: 50)
                DisplayPreference(imageName: "iu",levelPreference: self.data.Blabla,width: 50,height: 50,sizeThumb: 50)
                DisplayPreference(imageName: "iu",levelPreference: self.data.Museum,width: 50,height: 50,sizeThumb: 50)
                DisplayPreference(imageName: "iu",levelPreference: self.data.Party,width: 50,height: 50,sizeThumb: 50)
                DisplayPreference(imageName: "iu",levelPreference: self.data.Bar,width: 50,height: 50,sizeThumb: 50)
                }
                
                }
               
                
               
               
           
             ) .sheet(isPresented:self.$showExtraInfoUser ){
                VStack{
                     if   !self.viewRoot.displayContactPage {
                    DisplayProfileGenerale(data: self.manager.data!.data[0], langues: self.manager.data!.language)
                    Button(action: {
                        self.viewRoot.displayContactPage = true
                                     
                          
                      },
                             label: {Text("Contacter")})
                        
                    }
                     else{
    
                           Contacter(data: self.data, userid:self.data.UserProfileID,token:self.user.token).environmentObject(self.viewRoot)
                    }
                    
                    
                }
            }
            
     
                .padding(.bottom,30)
        
        
        
      
    }
}

}

