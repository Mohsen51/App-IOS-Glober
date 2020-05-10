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
    var country:String
}

class User: ObservableObject {
    
    @Published var name:String = ""
    @Published var school:String = ""
    @Published var status:Bool = false
    @Published var email:String = ""
    @Published var gender:Int = 1
    @Published var nationality:Int = 0
    @Published var dateOfBirth:Date = Date()
    @Published var city:Int = 0
    @Published var country:String = ""
    @Published var contacts = [UserCoordinates]()
    @Published var description:String = ""
    @Published var preferences = Array(repeating: 0, count: 6)
    @Published var languages = [UserLanguages]()
    @Published var pictureUrl:String = ""
    @Published var password:String = ""
    @Published var image: UIImage?
    
    @Published var token:String
    
    init(){
        self.token = "aaaa"
    }
    
    func encode_image_base64() -> String {
        let imageData:NSData = self.image!.pngData()! as NSData
        let strBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
        
        return strBase64
        
    }
    
    func format_before_Json() -> [String:Any]{
        var data: [String:Any] = [:]
        
        let city = ["Paris","Nantes","Lille"]
    
        data["FirstName"] = self.name
        data["Gender"] = self.gender
        data["Status"] = self.status
        data["University"] = self.school
        data["Email"] =  self.email
        data["DateOfBirth"] = self.dateOfBirth.millisecondsSince1970
        data["Description"] = self.description
        data["PasswordHash"] = self.password
        data["Pseudo"] = fetch_social_media_pseudo()
        data["NetworkName"] = fetch_social_media_name()
        data["City"] = city[self.city]
        data["Country"] = self.country
        data["About"] = self.description
        data["Party"] = self.preferences[0]
        data["Museum"] = self.preferences[1]
        data["Bar"] = self.preferences[2]
        data["Blabla"] = self.preferences[3]
        data["Sport"] = self.preferences[4]
        data["Film"] = self.preferences[5]
        data["Language"] = self.fetch_languages()
        
        print(data)
        
    
        return data
        
    }
    
    func fetch_social_media_pseudo() -> [String] {
         var data: [String] = []
        for contact in self.contacts{
            data.append(contact.identifiant)
        }
        return data
    }
    
    func fetch_social_media_name() -> [String] {
        var data: [String] = []
        let list = ["Facebook","phone", "Snapchat"]
        for contact in self.contacts{
            let name_social_media = list[contact.social_network]
            data.append(name_social_media)
        }
        return data
    }
    
    
    func fetch_languages() -> [String] {
        var data: [String] = []
       
        for langue in self.languages{
            data.append(langue.country)
        }
        return data
    }
    
    
    func encode_json(data:[String:Any]) -> Data{
       
        let JsonBody = try! JSONSerialization.data(withJSONObject: data)
        return JsonBody
    }
    
   
   
    
}

extension Date {
   var millisecondsSince1970:Int64 {
       return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
   }
}
