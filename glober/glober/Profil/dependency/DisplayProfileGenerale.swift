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
                VStack{
                    HStack{
                        Text("University")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .frame(width: 200)
                        .padding(.trailing, 179)
                    }
                    HStack{
                        Text("\(self.data.University ?? "")")
                    }.frame(width:300,height: 20)
                        .padding(.trailing,150)
                        .padding(.vertical,5)
                    .offset(x:-50,y:0)
                }
                VStack{
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
                        Text("Food & Drinks")
                        .frame(width: 200)
                        .padding(.trailing, 70)
                    }
                    HStack{
                        DisplayPreference(imageName: "Speaking", levelPreference: self.data.Blabla,width: 50,height: 50,sizeThumb: 20)
                        Spacer()
                        .frame(width: -15)
                        Text("Speaking")
                        .frame(width: 200)
                        .padding(.trailing, 70)
                    }
                    HStack{
                        DisplayPreference(imageName: "Louvre", levelPreference: self.data.Museum,width: 50,height: 50,sizeThumb: 20)
                        Spacer()
                        .frame(width: -15)
                        Text("Museums")
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
                        DisplayPreference(imageName: "Film", levelPreference: self.data.Sport,width: 50,height: 50,sizeThumb: 20)
                        Spacer()
                        .frame(width: -15)
                        Text("Films & Series")
                        .frame(width: 200)
                        .padding(.trailing, 70)
                    }
                    
                    HStack{
                        Text("Languages")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .frame(width: 200)
                        .padding(.trailing, 150)
                    }.padding(.bottom, 20)
                    HStack{
                          DisplayLangue(languesFormated:self.formListLanguages(languages: self.langues))
                    }
                }
                
                VStack{
                    HStack{
                         if (self.shownote){
                            Text("Note")
                            .fontWeight(.bold)
                            .font(.largeTitle)
                            .frame(width: 200)
                            .padding(.trailing, 140)
                        }
                         else{
                            Text("Description")
                            .fontWeight(.bold)
                            .font(.largeTitle)
                            .frame(width: 200)
                            .padding(.trailing, 140)
                        }
                            
                    }
                    ZStack{
                        HStack{
                            Rectangle()
                                .foregroundColor(Color.white)
                            .border(Color(red: 236/255, green: 236/255, blue:236/255), width: 2)
                            .cornerRadius(10)
                                .frame(width:300,height:150)
                            .padding(5)
                        }
                        HStack{
                            if (self.shownote){
                                Text("\(self.note.Note ?? "")")
                            }else{
                                Text("\(self.data.About ?? "")")
                                
                            }
                        }.frame(width:300,height:100)
                        .padding(5)
                        .multilineTextAlignment(.center)
                    }
                    
                    
                }
                 
                
        }
            
        }
         



}
}

