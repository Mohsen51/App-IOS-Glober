//
//  DisplayPreference.swift
//  glober
//
//  Created by Antonin Boulnois on 03/05/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct DisplayPreference: View {
    
    let preference = ["👍","👎","😍"]
    var imageName:String
    var levelPreference:Int
    
    init(imageName:String,levelPreference:Int){
        self.imageName = imageName
        self.levelPreference = levelPreference
    }
    
    var body: some View {
                   
           ZStack{
               
               Image(self.imageName)
               .resizable()
               .scaledToFit()
               .frame(width:150,height:150)
               
                Text(preference[self.levelPreference])
                .font(.custom("Arial", size: 50))
               
            }
                             
                    
    }
}

struct DisplayPreference_Previews: PreviewProvider {
    static var previews: some View {
        DisplayPreference(imageName: "iu", levelPreference: 0)
    }
}
