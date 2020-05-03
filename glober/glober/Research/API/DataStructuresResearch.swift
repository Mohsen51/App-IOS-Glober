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
        var id = UUID()
        var Name:String
        var UserId:Int
        var Country:String
        var Age:Int
        var Preference:[Dict]
    }
    
    struct Dict: Identifiable,Codable {
        var id = UUID()
        var Name:String
        var Level:Int
    }
}

struct ProfilResultsExtraInfo: Codable {
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

