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
    var userProfil:ProfilResultsExtraInfo
    @State var note:String = ""
    @State var isEditing = false
    
    init(data:ProfilResultsExtraInfo ){
        self.userProfil = data
        
    }
    
    var body: some View {
        VStack{
            Text("\(self.userProfil.data[0].FirstName)")
            
            TextView(text: $note, isEditing: $isEditing)
            .modifier(CustomStyleTextView())
            
            
            Button(
                action: { self.manager.contacte(urlparam: "http://212.47.232.226/api/users/requestContact",idUser:self.userProfil.data[0].UserId, token: self.user.token,message:self.note){
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


