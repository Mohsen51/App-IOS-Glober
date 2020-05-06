//
//  DisplayProfile.swift
//  glober
//
//  Created by Antonin Boulnois on 16/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct DisplayProfile: View {
    
    @EnvironmentObject var user:User
    @State var manager = APIProfil()
    @State var languages = [UserLanguages]()
   
    let genders = ["Man", "Woman", "Prefer not to say"]
    
    let preference = ["👍","👎","😍"]
    
    let languageFormated = { (language:String) -> UserLanguages in return UserLanguages(country:language)}
    
    
    
    func formListLanguages(languages:[String]) -> [UserLanguages]{
        var tmp = [UserLanguages]()
        for language in languages{
            tmp.append(languageFormated(language))
        }
        return tmp
    }
    var body: some View {
        
        VStack{
        
            Text("\(self.manager.data?.FirstName ?? "no name")")
            
            //Text("\(String(self.manager.data?.Age ?? -1) )")
            
            Text("\(self.genders[self.manager.data?.Gender ?? 2] )")
            
            Text("\(self.manager.data?.FirstName ?? "no name")")
            
            List(self.languages){
                UserLanguages in
                VStack{
                   Text("\(UserLanguages.country)")
                        .font(.system(size: 20, weight: .heavy, design: .default))
                   
                   }
                
            }
            
            // self.manager.data?.Bar to access Bar value
            
            Text("aaa").onAppear {
                
                self.manager.get_profil(urlparam: "http://212.47.232.226/api/users/profil",token: self.user.token){
                    result in
                    
                    if result {
                         self.languages = self.formListLanguages(languages: self.manager.data?.Language ?? [""])
                    }
                }
               
            }
        }
    }
}

