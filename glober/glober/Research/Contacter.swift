//
//  Contacter.swift
//  glober
//
//  Created by Antonin Boulnois on 21/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI
import TextView

struct Contacter: View {
    
    @EnvironmentObject var user:User
    @State var manager = APIContacte()
    @EnvironmentObject var viewRoot:ViewRouter
    var userProfil:ProfilResults.Data
    var userid:Int
    var token:String
    @State var note:String = ""
    @State var isEditing = false
    
    init(data:ProfilResults.Data,userid:Int,token:String){
        self.userProfil = data
        self.userid = userid
        self.token = token
        
    }
    
    var body: some View {
        VStack{
            Text("\(self.userProfil.FirstName)")
            
            //TextView(text: $note, isEditing: $isEditing)
            .modifier(CustomStyleTextView())
            TextField("Name",text : $note)
            
            
            Button(
                action: { self.manager.contacte(urlparam: "http://212.47.232.226/api/users/search/profile/contact/request",idUser:self.userid, token: self.token,message:self.note){
                    result in
                    
                    if result{
                         self.viewRoot.displayContactPage = false
                    }
                    
                    }
            },
                
                label:{Text("Submit")}
            )
        }
    }
}


