//
//  Home.swift
//  glober
//
//  Created by Antonin Boulnois on 09/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    @State private var displaySignUp = false
    @State private var displaySignIn = false
    @State private var menu = true
    
    var body: some View {
        VStack{
            if self.menu {
                Button(
                    action: {
                        self.displaySignUp = true
                        self.menu = false
                        }
                    ,label: { Text("Sign Up")}
                                      
                              
                ).sheet(isPresented: $displaySignUp, content: {
                     Location()
                })
                
                 Button(
                       action: {
                           self.displaySignIn = true
                           }
                       ,label: { Text("Sign Up")}
                                         
                                 
                   ).sheet(isPresented: $displaySignIn, content: {
                        Connection()
                   })
            }
            
           
            if self.displaySignUp == true {
               
                Location()
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
