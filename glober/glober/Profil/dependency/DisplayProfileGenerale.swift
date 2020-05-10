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
        ScrollView{
            VStack{
                    VStack{
                        Text("")
                            .padding(5)
                        HStack{
                            Banner(image: "iu", name: self.data.FirstName, date: self.data.DateOfBirth, gender: self.data.Gender)
                            .frame(width: 300)
                            .padding(.trailing, 100)
                        }
                    }
                    HStack{
                        Text("Preferences")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .frame(width: 200)
                        .padding(.trailing, 150)
                    }
                    
                    HStack{
                        DisplayPreference(imageName: "FoodAndDrink", levelPreference: self.data.Bar,width: 50,height: 50,sizeThumb: 20)
                            Spacer()
                            .frame(width: -15)
                        Text("Restaurants & Bar")
                        .frame(width: 200)
                        .padding(.trailing, 70)
                    }
                    HStack{
                        DisplayPreference(imageName: "Photographie", levelPreference: self.data.Blabla,width: 50,height: 50,sizeThumb: 20)
                        Spacer()
                        .frame(width: -15)
                        Text("Photographie")
                        .frame(width: 200)
                        .padding(.trailing, 70)
                    }
                    HStack{
                        DisplayPreference(imageName: "Louvre", levelPreference: self.data.Museum,width: 50,height: 50,sizeThumb: 20)
                        Spacer()
                        .frame(width: -15)
                        Text("Musée & Sortie")
                        .frame(width: 200)
                        .padding(.trailing, 70)
                    }
                    HStack{
                        DisplayPreference(imageName: "Party", levelPreference: self.data.Party,width: 50,height: 50,sizeThumb: 20)
                        Spacer()
                        .frame(width: -15)
                        Text("Party")
                        .frame(width: 200)
                        .padding(.trailing, 70)
                    }
                    HStack{
                        DisplayPreference(imageName: "Sports", levelPreference: self.data.Sport,width: 50,height: 50,sizeThumb: 20)
                        Spacer()
                        .frame(width: -15)
                        Text("Sports")
                        .frame(width: 200)
                        .padding(.trailing, 70)
                    }
                    
                    HStack{
                        Text("Languages")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .frame(width: 200)
                        .padding(.trailing, 150)
                    }
                    HStack{
                        List(formListLanguages(languages: self.langues )){
                            UserLanguages in
                            VStack{
                               Text("\(UserLanguages.country)")
                                    .font(.system(size: 20, weight: .heavy, design: .default))
                                         
                               
                               }
                            
                        }.frame(width: 150)
                        .padding(.trailing, 150)
                    }
                VStack{
                    HStack{
                            Text("Description")
                            .fontWeight(.bold)
                            .font(.largeTitle)
                            .frame(width: 200)
                            .padding(.trailing, 140)
                    }
                    HStack{
                            ZStack{
                                Rectangle()
                                .border(Color(red: 236/255, green: 236/255, blue:236/255), width: 5)
                                    .frame(height:200)
                                .foregroundColor(Color.white)
                                .cornerRadius(10)
                                .padding(5)
                                Text("\(self.data.About ?? "")")
                                    .foregroundColor(Color.black)
                            }
                            
                    }
                    Text("\(self.note.Note ?? ""  )")
                }
                 
                
        }
         
}

}
}
