//
//  DisplayProfile.swift
//  glober
//
//  Created by Antonin Boulnois on 16/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct DisplayProfile: View {
    
    @EnvironmentObject var token:Token
    @State var manager = APIProfil()
    
    init() {
        self.manager.get_profil(urlparam: "http://212.47.232.226/api/users/profil")
    }
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DisplayProfile_Previews: PreviewProvider {
    static var previews: some View {
        DisplayProfile()
    }
}
