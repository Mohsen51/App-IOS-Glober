//
//  PartialProfil.swift
//  glober
//
//  Created by Antonin Boulnois on 08/05/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import Foundation

struct PartialProfil: Codable {
    var success:Int
    var data:[DataPartialProfil]
    
   
    
   
}

struct DataPartialProfil: Identifiable,Codable {
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
