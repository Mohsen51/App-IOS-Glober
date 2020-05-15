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
    var university:String
    let genders = ["Man", "Woman", "Prefer not to say"]
    
    let ImageMan = [ "Image1","Image4","Image6"]
    let ImageWoman = [ "Image2","Image3","Image5"]
    let ImageMix = [ "Image1","Image2","Image3"]
    
    
    
    init(name:String,date:Int,country:String,gender:Int,university:String){
        self.name = name
        self.date = date
        self.country = country
        self.gender = gender
        self.university = university
        let number = Int.random(in: 0 ..< 2)
        
        if gender == 0 {
            self.image = ImageMan[number]
        }
        else if gender == 1 {
            self.image = ImageWoman[number]
        }
        else{
            self.image = ImageMix[number]
        }
        
       }
    
    var body: some View {
        VStack{
            HStack{
                Text("")
                .padding(5)
            }
            HStack{
                    
                Image(self.image)
                         .resizable()
                         .scaledToFit()
                         .frame(width:100,height:100)
                         .clipShape(Circle())
                         .shadow(radius: 8)
                    
                            VStack(alignment: .leading, spacing: 5){
                                HStack{
                                    Text("\(self.name)")
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.center)
                                    //if self.gender != -1 {
                                        //Text("\(self.genders[self.gender])")
                                            //.fontWeight(.bold)
                                }
                                HStack{
                                        if self.country != ""{
                                            Text("\(self.country )")
                                                .fontWeight(.bold)
                                        }
                                }
                                HStack{
                                    Text("\(self.date ) years")
                                }
                            }.offset(x:30,y:0)
                                       
                }.padding(.trailing, 200)
                    .frame(width:380)
        }



    }
    
             
             
              
             
            
            
            
}
        

        
        


