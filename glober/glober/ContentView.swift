//
//  ContentView.swift
//  glober
//
//  Created by Antonin Boulnois on 08/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
   //@EnvironmentObject var user:User
     @EnvironmentObject var token:Token
    
    
    var body: some View {
        Home()
    }
}

