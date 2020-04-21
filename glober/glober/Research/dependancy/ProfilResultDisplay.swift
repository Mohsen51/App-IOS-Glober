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
    
    init(pref:ProfilResults.Data){
        self.data = pref
    }
    
    @State var showExtraInfoUser = false
    @State var manager = APIResearchExtraInfoUser()
    
    var body: some View {
        
        VStack{
        Button(
            action: {
             withAnimation {
                
                self.manager.get_extra_info_user(urlparam: "http://212.47.232.226/api/users/search/"+String(self.data.UserId)){
                    result in
                    
                    if result {
                         self.showExtraInfoUser.toggle()
                    }
                }
            
             }
            },
            label: {
               VStack{
                   Text("\(self.data.Name)")
                   
                   Text("\(self.data.Country )")
                   
                   Text("\(String(self.data.Age))")
                   
                   List(self.data.Preference){
                       result in
                           Image("iu")
                                  .resizable()
                                  .scaledToFit()
                                  .frame(width:50,height:50)
                   }
               }
               }
             )
             
                .padding(.bottom,30)
          
          if self.showExtraInfoUser {
            ExtraInfoUser(data: self.manager.data!)
         }
        
        
        }
      
    }
}

