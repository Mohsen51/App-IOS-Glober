//
//  Results.swift
//  glober
//
//  Created by Antonin Boulnois on 16/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct Results: View {
    
    @State var manager = APIResearch()
    var results:[ProfilResults.Data]
    
    init(result:[ProfilResults.Data]){
        self.results = result
    }
    
    var body: some View {
        VStack{
            List(self.results){
                data in
                
                ProfilResultDisplay(pref: data)
                
                
            }
            Text("aaa")
        }
    }
}

