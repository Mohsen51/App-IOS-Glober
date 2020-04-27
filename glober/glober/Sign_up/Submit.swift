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
    @EnvironmentObject var viewRoot:ViewRouter
    
    var data:[String:Any] = [:]
   
   
   
    var body: some View {
        VStack{
            
           
            Text("aaa").onAppear{
                    self.manager.send_data_sign_up(body: self.user.format_before_Json(),urlparam:"http://212.47.232.226/api/users/signUp"){
                        result in
                            
                        if result {
                            self.viewRoot.page = "sign_in"
                        }
                        
                    }
                    
            }
           
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
