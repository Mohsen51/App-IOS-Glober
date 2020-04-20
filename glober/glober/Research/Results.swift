//
//  Results.swift
//  glober
//
//  Created by Antonin Boulnois on 16/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct Results: View {
    
    //@EnvironmentObject var token:Token
    @State var manager = APIResearch()
    var result:[ProfilResults.Data]
    
    init(result:[ProfilResults.Data]){
        self.result = result
    }
    
    var body: some View {
        VStack{
            //List()
            Text("aaa")
        }
    }
}

