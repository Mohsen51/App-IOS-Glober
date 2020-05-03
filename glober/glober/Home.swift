//
//  Home.swift
//  glober
//
//  Created by Antonin Boulnois on 09/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

class ViewRouter: ObservableObject {
    
    @Published var page:String = "home"
    @Published var displayResearch:Bool = false
    @Published var displayContactPage:Bool = false
    @Published var displayContactInfoPage:Bool = false
    
    
    
}


struct HomePage: View {
    
     @EnvironmentObject var viewRoot:ViewRouter
    
    var body: some View {
        ZStack{
            VStack{
                
            Image("Accueil")
                .padding(.trailing, 40)
                
            };VStack{
                Image("LogoLetter")
                .resizable()
                    .frame(width : 280.0,height : 90)
            }.offset(x: 0, y: -270);
            VStack{
                ZStack{
                    Button(
                        action: {
                            self.viewRoot.page = "sign_up"
                            })
                        {
                            Rectangle()
                                .frame(width: 320, height: 80, alignment: .center)
                                    .cornerRadius(50)
                                    .foregroundColor(.blue)
                                    
                        }
                            Text("Inscription")
                                .font(.largeTitle)
                                    .foregroundColor(.black)
                                        
                        
                                    
                }
                Button(action : {
                    self.viewRoot.page = "sign_in"
                }){
                    Text("Déjà Membre ? Connexion")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                    
                    
            }.offset(x: 0, y: 230)
                
            }
             
        }
}
        




struct Home: View {
    
    
    
    @EnvironmentObject var viewRoot:ViewRouter
    
   
    
    var body: some View {
        VStack{
            
            if self.viewRoot.page == "home" {
                HomePage()
            }
            
            if self.viewRoot.page == "sign_in" {
                 Connection()
                .transition(.scale)
            }
            
           
           if self.viewRoot.page == "sign_up" {
               
                Location()
                .transition(.scale)
            }
            
            
            if self.viewRoot.page == "dashbord" {
                Dashbord()
                .transition(.scale)
            }
            
           
        }
    }
}


