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
                            // preference 1
                            Preference(choice:0)
                            //preference 2
                            Preference(choice:1)
                        }
                    .padding(.bottom,10)
                    
                   
                        HStack{
                            // preference 1
                            Preference(choice:2)
                            //preference 2
                            Preference(choice:3)
                        }
                     .padding(.bottom,10)
                    
                   
                        HStack{
                            // preference 1
                            Preference(choice:4)
                            //preference 2
                            Preference(choice:5)
                    }
                }
                .padding(.horizontal,15)
            }
     
                    
          
       }
        .navigationBarTitle(Text("Preferences"), displayMode: .inline)
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
