//
//  DisplayProfileGenerale.swift
//  glober
//
//  Created by Antonin Boulnois on 08/05/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct DisplayProfileGenerale: View {
    
    var data:DataFullProfil
    var langues:[Langue]
    var note:Note
    
    init(data:DataFullProfil,langues:[Langue],note:Note){
        self.data = data
        self.langues = langues
        self.note = note
        
    }
    
    init(data:DataFullProfil,langues:[Langue]){
           self.data = data
           self.langues = langues
        self.note = Note(Note:"")
           
       }
       
    
    let genders = ["Man", "Woman", "Prefer not to say"]
      
    let preference = ["👍","👎","😍"]
      
    let languageFormated = { (language:String) -> UserLanguages in return UserLanguages(country:language)}
      
    
      
    func formListLanguages(languages:[Langue]?) -> [UserLanguages]{
          var tmp = [UserLanguages]()
          for language in languages!{
              tmp.append(languageFormated(language.Language))
          }
          return tmp
      }
    
    
    var body: some View {
         VStack{
                   
            Banner(image: "iu", name: self.data.FirstName, date: self.data.DateOfBirth, gender: self.data.Gender)
            
            DisplayPreference(imageName: "iu", levelPreference: self.data.Bar,width: 50,height: 50,sizeThumb: 50)
            DisplayPreference(imageName: "iu", levelPreference: self.data.Blabla,width: 50,height: 50,sizeThumb: 50)
            DisplayPreference(imageName: "iu", levelPreference: self.data.Museum,width: 50,height: 50,sizeThumb: 50)
            DisplayPreference(imageName: "iu", levelPreference: self.data.Party,width: 50,height: 50,sizeThumb: 50)
            DisplayPreference(imageName: "iu", levelPreference: self.data.Sport,width: 50,height: 50,sizeThumb: 50)
           
            List(formListLanguages(languages: self.langues )){
                       UserLanguages in
                       VStack{
                          Text("\(UserLanguages.country)")
                               .font(.system(size: 20, weight: .heavy, design: .default))
                          
                          }
                       
                   }
                   
                   
            Text("\(self.data.About ?? "")")
            
            Text("\(self.note.Note ?? ""  )")
    }
}

}
