//
//  Connection.swift
//  glober
//
//  Created by Antonin Boulnois on 09/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct Connection: View {
    
    @State var manager = APISignIn()
    @State private var username = ""
    @State private var password = ""
    @State var data:[String:Any] = [:]
    @State var errorMessage = false
   
    
    init(){
        self.data = ["username":self.username,"password":self.password]
    }
    
    func CheckIfFilled() -> Bool {
        if self.username == "" {
              return true
          }
              
        else if self.password == "" {
              return true
          }
          return false
      }
    
    var body: some View {
        VStack{
            TextField("Email",text : $username)
                      .padding()
                      .roundedGrayBorder()
            
            SecureField("Password",text : $password)
                      .padding()
                      .roundedGrayBorder()
            
             Button(
                action: {
                    if self.CheckIfFilled() == false{
                        self.errorMessage = false
                        self.manager.verify_authentification(body: self.data,urlparam:"http://212.47.232.226/api/users/SignIn")
                    }
                    else{
                        self.errorMessage = true
                    }
                    }
                ,label: { Text("Verify")}
                                  
                          
            )
            
            
            if self.errorMessage {
                Text("empty fields")
            }
        }
    }
}

struct Connection_Previews: PreviewProvider {
    static var previews: some View {
        Connection()
    }
}
