//
//  DisplayProfile.swift
//  glober
//
//  Created by Antonin Boulnois on 16/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct DisplayProfile: View {
    
    @EnvironmentObject var user:User
    @EnvironmentObject var viewRoot:ViewRouter
    @State var manager = APIProfil()
    
    @State private var loading:Bool = true
  
    
    var body: some View {
        VStack{
            
             if (self.loading == false){
                DisplayProfileGenerale(data: self.manager.data!.data[0], langues: self.manager.data!.language)
            }
            
            Button(action:{
                self.user.token = ""
                self.viewRoot.page = "home"
            }
                
                
                , label: {
                Text("Deconnection")
            })
       
           
        
            Text("").onAppear {
                
                self.manager.get_profil(urlparam: "http://212.47.232.226/api/users/profile",token: self.user.token){
                    result in
                    
                    if result {
                        
                        self.loading = false
                    }
                }
               
            }
        }
        }
    }


