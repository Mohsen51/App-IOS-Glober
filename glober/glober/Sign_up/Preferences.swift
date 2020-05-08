//
//  Preferences.swift
//  glober
//
//  Created by Antonin Boulnois on 08/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct Preferences: View {
    
    @EnvironmentObject var user:User
    
    var body: some View {
        
        NavigationView{
            ScrollView{
                VStack{
                    HStack{
                            Text("Sélectionne tes passion 👇🏻")
                                .padding(.leading, 90)
                            .modifier(CustomStyleText3())
                            Spacer()
                    }.offset(x: 0, y: -20);
                    
                    HStack{
                        Text("Choisit 1 des 3 niveaux proposés par les emojis ")
                        .modifier(CustomStyleText4())
                            .padding(.leading, 65)
                        Spacer()
                    };
                        
                        HStack{
                            // preference 1
                            Preference(choice:0,imageName: "FoodAndDrink")
                            //preference 2

                            Preference(choice:1,imageName: "Louvre")

                        }
                        .padding(.bottom,10);
                    
                   
                        HStack{
                            // preference 1

                            Preference(choice:2,imageName: "Party")
                            //preference 2
                            Preference(choice:3,imageName: "Sports")

                        }
                        .padding(.bottom,10);
                    
                   
                        HStack{
                            // preference 1
                            Preference(choice:4,imageName: "Film")
                            //preference 2
                            Preference(choice:5,imageName: "Photographie")
                    }
                }
                .padding(.horizontal,15)
            }
     
                    
          
       }
        .navigationBarTitle(Text("Hobbits"), displayMode: .inline)
        .navigationBarItems(trailing:
                      
                   NavigationLink(destination: Profil()){
                          Text("Next ").multilineTextAlignment(.trailing)
                      }
                  
              )
      
    }
}

struct Preferences_Previews: PreviewProvider {
    static var previews: some View {
        Preferences()
    }
}
