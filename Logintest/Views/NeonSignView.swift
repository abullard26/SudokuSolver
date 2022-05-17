//
//  NeonSignView.swift
//  Logintest
//
//  Created by Alexander Bullard (student LM) on 5/29/22.
//

import Foundation
import SwiftUI

struct NeonSignView:View{
    
    var body: some View{
        VStack{
            Spacer()
            HStack{
                Spacer()
                NeonLineView(color: Color("NeonOrangeShadow"), width: UIScreen.main.bounds.width*0.072, rotation: 0.0, vertical: false)
                NeonLineView(color: Color("NeonShadow"), width: UIScreen.main.bounds.width*0.666, rotation: 0.0, vertical: false)
                NeonLineView(color: Color("NeonOrangeShadow"), width: UIScreen.main.bounds.width*0.072, rotation: 0.0, vertical: false)
                Spacer()
            }
            Spacer(minLength: 100)
            HStack{
                Spacer()
                NeonLineView(color: Color("NeonOrangeShadow"), width: UIScreen.main.bounds.width*0.072, rotation: 0.0, vertical: false)
                NeonLineView(color: Color("NeonShadow"), width: UIScreen.main.bounds.width*0.666, rotation: 0.0, vertical: false)
                NeonLineView(color: Color("NeonOrangeShadow"), width: UIScreen.main.bounds.width*0.072, rotation: 0.0, vertical: false)
                Spacer()
            }
            Spacer()
        }
    }
}
