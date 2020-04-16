//
//  DataStructures.swift
//  glober
//
//  Created by Antonin Boulnois on 13/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import Foundation


struct Test: Codable{
    
    struct Data : Codable {
    var UserProfileID:Int
    var FirstName:String
    var University:String
    var Status:Int
    var Email:String
    var Gender:Int
    var DateOfBirth:String
    var PasswordHash:String
    var About:String
    //var ProfilePic:String
    var Country:String
    var City:String
    var LastConnection:String
    
    }

    
    var success:Int
    var response:[Data]
}


struct Response: Codable{
    
    var success:Int
    var code:Int
    var message:String
    
}
