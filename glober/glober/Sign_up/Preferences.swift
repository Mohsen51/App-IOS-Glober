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
                            Text("Select your passions 👇🏻")
                                .multilineTextAlignment(.center)
                                
                            .modifier(CustomStyleText3())
                                
                        
                    }.offset(x: 0, y: -50);
                    
                    HStack{
                        Text("Choose 1 of the 3 levels proposed by the emojis ")
                            .multilineTextAlignment(.center)
                        .modifier(CustomStyleText4())
                            .padding(.bottom,30)
                        
                    }.offset(x: 0, y: -15);
                    VStack{
                        HStack{
                            Text("Food & Drinks")
                                .offset(x:-15,y:0)
                            Spacer()
                                .frame(width:60)
                            Text("Museums")
                        }.modifier(CustomStyleText4())
                        HStack{
                            // preference 1
                            Preference(choice:0,imageName: "FoodAndDrink").environmentObject(self.user)
                            //preference 2

                            Preference(choice:1,imageName: "Louvre").environmentObject(self.user)

                        }
                        .padding(.bottom,10);
                    };
                    VStack{
                        HStack{
                            Text("Party")
                                //.offset(x:-20,y:0)
                            Spacer()
                                .frame(width:120)
                            Text("Sports")
                        }.modifier(CustomStyleText4())
                        HStack{
                                // preference 1

                                Preference(choice:2,imageName: "Party").environmentObject(self.user)
                                //preference 2
                                Preference(choice:3,imageName: "Sports").environmentObject(self.user)

                        }
                        .padding(.bottom,10);
                    };
                    VStack{
                        HStack{
                            Text("Films & Series")
                                .offset(x:-25,y:0)
                            Spacer()
                                .frame(width:60)
                            Text("Talking")
                        }.modifier(CustomStyleText4())
                        HStack{
                                // preference 1
                                Preference(choice:4,imageName: "Film").environmentObject(self.user)
                                //preference 2
                                Preference(choice:5,imageName: "Speaking").environmentObject(self.user)
                        }
                    }

                        
                }
                .padding(.horizontal,15)
            }
     
                    
          
       }
        .navigationBarTitle(Text("Hobbits"), displayMode: .inline)
        .navigationBarItems(trailing:
                      
                   NavigationLink(destination: Profil().environmentObject(self.user)){
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
