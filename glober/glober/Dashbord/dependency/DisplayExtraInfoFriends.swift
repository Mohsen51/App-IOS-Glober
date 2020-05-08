//
//  DisplayExtraInfoFriends.swift
//  glober
//
//  Created by Antonin Boulnois on 01/05/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct DisplayExtraInfoUser: View {
    
    @EnvironmentObject var viewRoot:ViewRouter
    @EnvironmentObject var user:User
    @State private var isSheet:Bool = false
    var results:ProfilResultsExtraInfo
    @State var languages:[UserLanguages]  = []
   
  
    
    init(data:ProfilResultsExtraInfo){
        results = data
        
    }
    
    func formListLanguages(languages:[ProfilResultsExtraInfo.Langue]) -> [UserLanguages]{
             var tmp = [UserLanguages]()
             for language in languages{
                tmp.append(languageFormated(language.Language))
             }
             return tmp
         }
         
    
    let languageFormated = { (language:String) -> UserLanguages in return UserLanguages(country:language)}
    
    
    
   
    var body: some View {
       
            VStack{
                Text("\(self.results.data[0].About)")
                
                List(self.languages){
                   UserLanguages in
                   VStack{
                      Text("\(UserLanguages.country)")
                           .font(.system(size: 20, weight: .heavy, design: .default))
                      }
                }.onAppear(){
                    
                   
                
                    self.languages = self.formListLanguages(languages: self.results.language)
                
            }
               
              
                
                
                
             
        }
        
        
       
}
}
