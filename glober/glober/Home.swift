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
    
    
    
}


struct HomePage: View {
    
     @EnvironmentObject var viewRoot:ViewRouter
    
    var body: some View {
        VStack{
        Button(
            action: {
                self.viewRoot.page = "sign_up"
                }
            ,label: { Text("Sign Up")}
                              
                      
        )
            .padding()
        
         Button(
               action: {
                 self.viewRoot.page = "sign_in"
                   }
               ,label: { Text("Sign In")}
                                 
                         
           )
        }
    }
}


struct Home: View {
    
    @State private var displaySignUp = false
    @State private var displaySignIn = false
    @State private var menu = true
    
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


