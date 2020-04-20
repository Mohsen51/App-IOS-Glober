//
//  Dashbord.swift
//  glober
//
//  Created by Antonin Boulnois on 20/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct Dashbord: View {
    
    @State private var selection = 0
    @EnvironmentObject var user:User
    @EnvironmentObject var viewRoot:ViewRouter
    
    var body: some View {
        VStack{
            
         
           TabView {
                Text("The content of the second view")
                .tabItem {
                    Image(systemName: "magnifyinglass.circle")
                    Text("Second Tab")
                             }
                Text("The content of the third view")
                .tabItem {
                    Image(systemName: "phone.fill")
                    Text("Third Tab")
                             }
                DisplayProfile()
                .tabItem {
                   Image(systemName: "phone.fill")
                   Text("profil")
                 
                 }
            }
        }
    }
}

