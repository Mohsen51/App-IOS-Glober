//
//  ExtraInfoUser.swift
//  glober
//
//  Created by Antonin Boulnois on 21/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct ExtraInfoUser: View {
    
    @EnvironmentObject var viewRoot:ViewRouter
    @EnvironmentObject var user:User
    var results:ProfilResultsExtraInfo
    @State var languages:[UserLanguages]  = []
    
  
    
    init(data:ProfilResultsExtraInfo){
        results = data
    }
    
    func formListLanguages(languages:[String]) -> [UserLanguages]{
             var tmp = [UserLanguages]()
             for language in languages{
                 tmp.append(languageFormated(language))
             }
             return tmp
         }
         
    
    let languageFormated = { (language:String) -> UserLanguages in return UserLanguages(country:language)}
    
    
    
   
    var body: some View {
        
        NavigationView{
            VStack{
                Text("\(self.results.About)")
                
                List(self.languages){
                   UserLanguages in
                   VStack{
                      Text("\(UserLanguages.country)")
                           .font(.system(size: 20, weight: .heavy, design: .default))
                      }
                }.onAppear(){
                    
                    self.viewRoot.displayContactPage = false
                
                    self.languages = self.formListLanguages(languages: self.results.Langues)
                
            }
            
                Button(action: {self.viewRoot.displayContactPage = true},
                   label: {Text("Contacter")})
        }
        }
        .navigationBarItems(trailing:
            NavigationLink(destination: Contacter(data:self.results),isActive: self.$viewRoot.displayContactPage){
                                      Text(" ").multilineTextAlignment(.trailing)
                                  }
                           )
}
}


