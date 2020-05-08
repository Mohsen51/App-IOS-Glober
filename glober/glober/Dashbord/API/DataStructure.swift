//
//  DataStructure.swift
//  glober
//
//  Created by Antonin Boulnois on 01/05/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import Foundation
import SwiftUI

struct SocialNetwork :Codable{
    
    var success:Int
    var data:[Data]
    
    struct Data : Identifiable,Codable{
        var id = UUID()
        var NetworkName:String
        var Identifiant:String
    }
}

struct Friends: Codable {
     var success:Int
       var Friends:[DataUser]
    var Requests:[DataUser]
       
        

}
    
    struct DataUser: Identifiable,Codable {
           var id:UUID?
           var Country:String
           var DateOfBirth:Int
           var FirstName:String
           var UserProfileID:Int
    }

struct JustFriends: Codable {
     var success:Int
       var data:[DataUser]
        var code:Int?
       
    }
