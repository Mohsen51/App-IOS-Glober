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

    var shownote:Bool

    init(data:DataFullProfil,langues:[Langue],note:Note){
        self.data = data
        self.langues = langues
        self.note = note
        self.shownote = true

        
    }
    
    init(data:DataFullProfil,langues:[Langue]){
        self.data = data
        self.langues = langues
        self.note = Note(Note:"")
        self.shownote = false

           
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

                    VStack(alignment: .leading, spacing: 5){
                        Text("")
                            .padding(5)
                        HStack{
                            Banner( name: self.data.FirstName, date: self.data.DateOfBirth, country: self.data.Country,gender:self.data.Gender,university: self.data.University ?? "")
                        }.padding(.leading,35)
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
                    }.padding(.bottom, 10)
                    HStack{
                          DisplayLangue(languesFormated:self.formListLanguages(languages: self.langues))
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
                        if (self.shownote){
                            Text("\(self.note.Note ?? "")")
                        }else{
                            Text("\(self.data.About ?? "")")
                            
                        }
                    }
                    
                    
                }
                 
                
        }
            
        }
         



}
}

