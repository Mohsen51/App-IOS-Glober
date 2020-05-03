//
//  ContactInfo.swift
//  glober
//
//  Created by Antonin Boulnois on 01/05/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct ContactInfo: View {
    
    @EnvironmentObject var user:User
    @EnvironmentObject var viewRoot:ViewRouter
    
    var result:[SocialNetwork.Data]
    
    init(result:[SocialNetwork.Data]){
        self.result = result
    }
    
    var body: some View {
        VStack{
        List(self.result){
            data in
            
            Text("\(data.NetworkName)")
            Text("\(data.Identifiant)")
        }
        }
    }
}


