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
    
    
}


struct Home: View {
    
    @State private var displaySignUp = false
    @State private var displaySignIn = false
    @State private var menu = true
    
    @ObservedObject var viewRoot = ViewRouter()
    
   
    
    var body: some View {
        VStack{
            if self.viewRoot.page == "home" {
                Button(
                    action: {
                        self.viewRoot.page = "sign_up"
                        }
                    ,label: { Text("Sign Up")}
                                      
                              
                )
                
                 Button(
                       action: {
                         self.viewRoot.page = "sign_in"
                           }
                       ,label: { Text("Sign In")}
                                         
                                 
                   )
            }
            
            if self.viewRoot.page == "sign_in" {
                 Connection().environmentObject(self.viewRoot)
                .transition(.scale)
            }
            
           
           if self.viewRoot.page == "sign_up" {
               
                Location().environmentObject(self.viewRoot)
                .transition(.scale)
            }
            
            
            if self.viewRoot.page == "dashbord" {
                Dashbord()
                .transition(.scale)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
