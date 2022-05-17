//
//  NeonLineView.swift
//  Logintest
//
//  Created by Alexander Bullard (student LM) on 5/24/22.
//

import Foundation
import SwiftUI
import UIKit

struct NeonLineView:View{
    
    var color:Color
    var width:CGFloat
    var rotation:Double
    var vertical:Bool
    
    var body: some View{
        if vertical{
            ZStack{
                
                Rectangle().fill(.radialGradient(Gradient(colors: [Color.white, Color("NeonShadow")]), center: .center, startRadius: 0, endRadius: 50))
                
            }.rotationEffect(Angle(degrees: rotation))
        }
        else{
            ZStack{
                
                Rectangle()
                    .fill(.linearGradient(Gradient(colors: [color,Color.white, color]), startPoint: .top, endPoint: .bottom))
                    .cornerRadius(5)
                    .blur(radius: 1)
                    .shadow(color: color, radius: 30, x: 0, y: 0)
                    .shadow(color: color, radius: 30, x: 0, y: 0)
                    .frame(width: width, height: 14, alignment: .center)

            }.rotationEffect(Angle(degrees: rotation))
        }
    }
}

