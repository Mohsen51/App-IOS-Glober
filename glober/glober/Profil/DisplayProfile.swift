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
    @State private var loading:Bool = true
    let genders = ["Man", "Woman", "Prefer not to say"]
    
    let preference = ["👍","👎","😍"]
    
    let languageFormated = { (language:String) -> UserLanguages in return UserLanguages(country:language)}
    
    
    
    func formListLanguages(languages:[UserProfile.Langue]?) -> [UserLanguages]{
        var tmp = [UserLanguages]()
        for language in languages!{
            tmp.append(languageFormated(language.Language))
        }
        return tmp
    }
    var body: some View {
        
        VStack{
        
            if (self.loading == false){
            Text("\(self.manager.data?.data[0].FirstName ?? "no name")")
            //birth of day == Age
             Text("\(self.manager.data?.data[0].DateOfBirth ?? -1)")
            
            Text("\(self.manager.data?.data[0].Gender ?? -1)")
            
                DisplayPreference(imageName: "iu",levelPreference: (self.manager.data?.data[0].Bar)!)
                DisplayPreference(imageName: "iu",levelPreference: (self.manager.data?.data[0].Blabla)!)
                DisplayPreference(imageName: "iu",levelPreference: (self.manager.data?.data[0].Museum)!)
                DisplayPreference(imageName: "iu",levelPreference: (self.manager.data?.data[0].Party)!)
                DisplayPreference(imageName: "iu",levelPreference: (self.manager.data?.data[0].Bar)!)
            
        
           List(self.languages){
                UserLanguages in
                VStack{
                   Text("\(UserLanguages.country)")
                        .font(.system(size: 20, weight: .heavy, design: .default))
                   
                   }
                
            }
            }
            
            
            Text("").onAppear {
                
                self.manager.get_profil(urlparam: "http://212.47.232.226/api/users/profile",token: self.user.token){
                    result in
                    
                    if result {
                        self.languages = self.formListLanguages(languages: self.manager.data?.language )
                        self.loading = false
                    }
                }
               
            }
        }
    }
}

