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
    var width:CGFloat?
    var heigth:CGFloat?
    
    init(imageName:String,levelPreference:Int,width:Int,height:Int){
        self.imageName = imageName
        self.levelPreference = levelPreference > 2 ? 0 : levelPreference
        self.width = CGFloat(width)
        self.heigth = CGFloat(height)
          
    }
    
    var body: some View {
                   
           ZStack{
               
               Image(self.imageName)
               .resizable()
               .scaledToFit()
                .frame(width:self.width,height:self.heigth)
               
                Text(preference[self.levelPreference])
                .font(.custom("Arial", size: 50))
               
            }
                             
                    
    }
}

