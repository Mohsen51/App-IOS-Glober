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
    @State var manager = APIProfil()
   
    
    var body: some View {
        
        VStack{
        
            Text("aaa").onAppear {
                
                self.manager.get_profil(urlparam: "http://212.47.232.226/api/users/profil",token: self.user.token)
                
            }
        }
    }
}

