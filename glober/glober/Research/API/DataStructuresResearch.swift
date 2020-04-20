//
//  DataStructuresResearch.swift
//  glober
//
//  Created by Antonin Boulnois on 16/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import Foundation
import SwiftUI


struct ProfilResults: Identifiable,Codable {
    var id = UUID()
    var success:Int
    var data:[Data]
    
    struct Data: Codable {
        var Name:String
        var UserId:Int
        var Country:String
        var Age:Int
        var Preference:[Dict]
    }
    
    struct Dict: Codable {
        var Name:String
        var Level:Int
    }
}


struct SystemServices: ViewModifier
{
    static var user = User()
    static var token = Token()
    func body(content: Content) -> some View {
    content
        // defaults
        .accentColor(.red)
        // services
        .environmentObject(Self.token)
        .environmentObject(Self.user)
      
}}
