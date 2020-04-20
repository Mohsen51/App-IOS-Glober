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


