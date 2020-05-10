//
//  DisplayLangue.swift
//  glober
//
//  Created by Antonin Boulnois on 10/05/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct DisplayLangue: View {
    
    var languesFormated:[UserLanguages]
    init(languesFormated:[UserLanguages]){
        self.languesFormated = languesFormated
    }
    var body: some View {
        VStack{
            ForEach(self.languesFormated){
                result in
                Text("\(result.country)")
            }
        }
}
}
