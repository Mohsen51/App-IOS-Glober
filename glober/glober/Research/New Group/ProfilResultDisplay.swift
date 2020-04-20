//
//  ProfilResultDisplay.swift
//  glober
//
//  Created by Antonin Boulnois on 20/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct ProfilResultDisplay: View {
    
    var data:ProfilResults.Data
    
    init(pref:ProfilResults.Data){
        self.data = pref
    }
    
    var body: some View {
        VStack{
            Text("\(self.data.Name)")
            
            Text("\(self.data.Country )")
            
            Text("\(String(self.data.Age))")
            
            List(self.data.Preference){
                result in
                    Image("iu")
                           .resizable()
                           .scaledToFit()
                           .frame(width:50,height:50)
            }
        }
    }
}

