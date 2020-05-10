//
//  FullProfile.swift
//  glober
//
//  Created by Antonin Boulnois on 08/05/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import Foundation

struct FullProfil: Codable {
    
    var success:Int
    var data:[DataFullProfil]
    var language:[Langue]
    var note:[Note]?
    
}

struct DataFullProfil: Codable {
    var FirstName:String
    var DateOfBirth:Int
    var Country:String
    var Gender:Int
    var Bar:Int
    var Blabla:Int
    var Party:Int
    var Museum:Int
    var Sport:Int
    var About:String?
    var University:String?
    var UserProfileID:Int?
    
}

struct Note:Codable{
    var Note:String?
}

struct Langue:Codable {
    var Language:String
}
