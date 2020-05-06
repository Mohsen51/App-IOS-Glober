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
    
    struct Data: Codable{
        var FirstName:String
        //var Age:Int
        var Country:String
        var Gender:Int
        var Bar:Int
        var Blabla:Int
        var Party:Int
        var Museum:Int
        var Sport:Int
        var Language:[String]
        var About:String
        //var Image: UIImage?
    }

}
