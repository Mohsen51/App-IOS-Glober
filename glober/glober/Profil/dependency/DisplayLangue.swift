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
                 .font(.system(size: 10, weight: .heavy, design: .default))
            }
            .frame(width: 150)
            .padding(.trailing, 150)
        }
          .padding(.bottom, 150)
}
}
