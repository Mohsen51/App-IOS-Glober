//
//  Submit.swift
//  glober
//
//  Created by Antonin Boulnois on 08/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct Submit: View {
    
    @State var manager = POST()
    
    let data: [String:String] = ["email":"aaaa","password":"aaaa","UserName":"aaaa"]
    
    init(){
        manager.send_data(body: data,urlparam:"http://212.47.232.226/api/users/8")
    }
   
    var body: some View {
        VStack{
            if (self.manager.data != nil) {
                Text("aaaaa")
            }
        }
    }
}

struct Submit_Previews: PreviewProvider {
    static var previews: some View {
        Submit()
    }
}
