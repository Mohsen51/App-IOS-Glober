//
//  DataStructuresProfil.swift
//  glober
//
//  Created by Antonin Boulnois on 16/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import Foundation
import SwiftUI


struct UserProfile: Codable {

    
    var success:Int
    var data:[Data]
    var language:[Langue]
    struct Data: Codable{
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
        //var Image: UIImage?
    }
    
    struct Langue:Codable {
        var Language:String
    }

}
