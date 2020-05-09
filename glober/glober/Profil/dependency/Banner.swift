//
//  Banner.swift
//  glober
//
//  Created by Antonin Boulnois on 08/05/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct Banner: View {
    
    var image:String
    var name:String
    var date:Int
    var gender:Int
    var country:String
    
     let genders = ["Man", "Woman", "Prefer not to say"]
    init(image:String,name:String,date:Int,gender:Int){
        self.image = image
        self.name = name
        self.date = date
        self.gender = gender
        self.country = ""
    }
    
    init(image:String,name:String,date:Int,country:String){
           self.image = image
           self.name = name
           self.date = date
           self.country = country
        self.gender = -1
       }
    var body: some View {
          HStack{
            Image(self.image)
                 .resizable()
                  .scaledToFit()
                 .frame(width:100,height:100)
             Text("\(self.name)")
             //date == Age
              Text("\(self.date )")
             
            if self.gender != -1 {
            Text("\(self.genders[self.gender])")
                 }
            
            if self.country != ""{
                            Text("\(self.country )")
                       }
            }
        
    }
        
        
    }


