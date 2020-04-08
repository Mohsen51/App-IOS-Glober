//
//  User.swift
//  glober
//
//  Created by Antonin Boulnois on 08/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import Foundation
import SwiftUI

struct UserCoordinates: Identifiable,Encodable {
    var id = UUID()
    var social_network:Int
    var identifiant:String
}

struct UserLanguages: Identifiable,Encodable {
    var id = UUID()
    var country:Int
}

class User: ObservableObject {
    
    @Published var name:String = ""
    @Published var school:String = ""
    @Published var status:Bool = false
    @Published var email:String = ""
    @Published var gender:Int = 1
    @Published var nationality:Int = 0
    @Published var dateOfBirth:Date = Date()
    @Published var city:Int = -1
    @Published var contacts = [UserCoordinates]()
    @Published var description:String = ""
    @Published var preferences = Array(repeating: 1, count: 6)
    @Published var languages = [UserLanguages]()
    @Published var pictureUrl:String = ""
    @Published var password:String = ""
    @Published var image: Image?
    
   
    
}
