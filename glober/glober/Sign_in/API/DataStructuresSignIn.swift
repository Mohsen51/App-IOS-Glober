//
//  DataStructures.swift
//  glober
//
//  Created by Antonin Boulnois on 13/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import Foundation
import SwiftUI

class Identifiant: Codable {
    var token:String
}

class Token: ObservableObject {
    @Published var token:String = ""
}


struct Success: Codable {
    var success:Int
}

