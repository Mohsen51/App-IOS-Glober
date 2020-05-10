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
    @State var languesFormated:[UserLanguages] = []
    @State var showLanguage:Bool = false
    
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
        return  tmp
        
      }
    
    
    var body: some View {
        ScrollView{
         VStack{
        
        
            VStack{
                Text("")
                    .padding(20)
                HStack{
                    Banner(image: "iu", name: self.data.FirstName, date: self.data.DateOfBirth, country: self.data.Country,gender:self.data.Gender,university: self.data.University ?? "")
                }
            }
            HStack{
                Text("Preferences")
                .fontWeight(.bold)
                .font(.largeTitle)
            }
            HStack{
                DisplayPreference(imageName: "FoodAndDrink", levelPreference: self.data.Bar,width: 50,height: 50,sizeThumb: 20)
                Text("Restaurants & Bar")
            }
            HStack{
                DisplayPreference(imageName: "Photographie", levelPreference: self.data.Blabla,width: 50,height: 50,sizeThumb: 20)
                Text("Photographie")
            }
            HStack{
                DisplayPreference(imageName: "Louvre", levelPreference: self.data.Museum,width: 50,height: 50,sizeThumb: 20)
                Text("Musée & Sortie")
            }
            
            
          
            DisplayLangue(languesFormated:self.formListLanguages(languages: self.langues))
          
            
                
        
        
            Text("\(self.data.About ?? "")")
            
            Text("\(self.note.Note ?? ""  )")
                }
        }
    }
        
    

}

