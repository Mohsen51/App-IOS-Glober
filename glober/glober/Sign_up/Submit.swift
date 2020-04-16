//
//  Submit.swift
//  glober
//
//  Created by Antonin Boulnois on 08/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct Submit: View {
    
    @State var manager = APISignUp()
    @EnvironmentObject var user:User
    
    var data:[String:Any] = [:]
   
   
   
    var body: some View {
        VStack{
            Button(
                action: {
                    self.manager.send_data_sign_up(body: self.user.format_before_Json(),urlparam:"http://212.47.232.226/api/users/signUp")
                   
            }, label: {Text("click")}
            
            )
           
            if (self.manager.errorSignUp) {
                Text("Email alreday used ! ")
            }
        }
    }
}

struct Submit_Previews: PreviewProvider {
    static var previews: some View {
        Submit()
    }
}
