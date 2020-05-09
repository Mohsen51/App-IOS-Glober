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
    var userInfo:DataFullProfil
    
    var result:[SocialNetwork.Data]
    
    init(result:[SocialNetwork.Data],userinfo:DataFullProfil){
        self.result = result
        self.userInfo = userinfo
    }
    
    var body: some View {
        VStack{
            
        Banner(image: "iu", name: self.userInfo.FirstName, date: self.userInfo.DateOfBirth, country:self.userInfo.Country)
            
        List(self.result){
            data in
            
            Text("\(data.NetworkName)")
            Text("\(data.Identifiant)")
        }
        }
    }
}


