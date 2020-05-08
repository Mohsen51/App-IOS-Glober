//
//  DataStructuresResearch.swift
//  glober
//
//  Created by Antonin Boulnois on 16/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import Foundation
import SwiftUI


struct ProfilResults: Codable {
    var success:Int
    var data:[Data]
    
    struct Data: Identifiable,Codable {
        var id:UUID?
        var FirstName:String
        var UserProfileID:Int
        var Country:String
        var DateOfBirth:Int //Age actually
        var Bar:Int
        var Blabla:Int
        var Museum:Int
        var Party:Int
        var Sport:Int
    }
    
   
}





struct ProfilResultsExtraInfo: Codable {
    var success:Int
    
    var data:[Data]
    var language:[Langue]
    struct Data: Codable {
    var FirstName:String
    var DateOfBirth:Int
    var Country:String
    var Gender:Int
    var Bar:Int
    var Blabla:Int
    var Party:Int
    var Museum:Int
    var Sport:Int
    var About:String
    //var Image:String
    }
    
     struct Langue:Codable {
           var Language:String
       }
    
}

struct ProfilFriendResultsExtraInfo: Codable {
    var success:Int
    
    var data:[Data]
    
    struct Data: Codable {
    var UserId:Int
    var FirstName:String
    var Age:Int
    var Country:String
    var Gender:Int
    var Bar:Int
    var Blabla:Int
    var Party:Int
    var Museam:Int
    var Sport:Int
    var Langues:[String]
    var About:String
    //var Image:String
    }
    
}


struct HandleCodeEroor: Codable {
    var success:Int
    var code:Int?
}
