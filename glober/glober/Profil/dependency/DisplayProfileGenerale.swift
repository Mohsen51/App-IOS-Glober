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
            VStack{
                Text("")
                    .padding(20)
                HStack{
                    Banner(image: "iu", name: self.data.FirstName, date: self.data.DateOfBirth, country: self.data.Country,gender:self.data.Gender,university: self.data.University ?? "")
                }.offset(x:-60,y:-30)
            }
            HStack{
                Text("Preferences")
                .fontWeight(.bold)
                .font(.largeTitle)
            }.offset(x:-90,y:-30)
            HStack{
                DisplayPreference(imageName: "FoodAndDrink", levelPreference: self.data.Bar,width: 50,height: 50,sizeThumb: 20)
                Text("Restaurants & Bar")
            }.offset(x:-70,y:-30)
            HStack{
                DisplayPreference(imageName: "Photographie", levelPreference: self.data.Blabla,width: 50,height: 50,sizeThumb: 20)
                Text("Photographie")
            }.offset(x:-85,y:-30)
            HStack{
                DisplayPreference(imageName: "Louvre", levelPreference: self.data.Museum,width: 50,height: 50,sizeThumb: 20)
                Text("Musée & Sortie")
            }.offset(x:-80,y:-30)
            HStack{
                DisplayPreference(imageName: "Party", levelPreference: self.data.Party,width: 50,height: 50,sizeThumb: 20)
                Text("Party")
            }.offset(x:-111,y:-30)
            HStack{
                DisplayPreference(imageName: "Sports", levelPreference: self.data.Sport,width: 50,height: 50,sizeThumb: 20)
                Text("Sports")
            }.offset(x:-110,y:-30)
            
            
           
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
