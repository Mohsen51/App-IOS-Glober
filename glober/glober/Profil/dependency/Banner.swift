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
                 .clipShape(Circle())
                 .shadow(radius: 8)
            Spacer()
                .frame(width: 20)
                    VStack{
                        HStack{
                            if self.gender != -1 {
                                Text("\(self.genders[self.gender])")
                                    .fontWeight(.bold)
                            }
                            
                            if self.country != ""{
                                Text("\(self.country )")
                                    .fontWeight(.bold)
                            }
                            Text("\(self.name)")
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                        }
                        Spacer()
                            .frame(height: 5)
                        HStack{
                            Text("\(self.date ) ans")
                                Spacer()
                                    .frame(width: 45)
                        }
                               
                        }
            }.padding(5)
             
             
              
             
            
            
            
            }
        
}
        
        


