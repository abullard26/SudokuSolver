//
//  GameTimer.swift
//  Logintest
//
//  Created by Alexander Bullard (student LM) on 5/27/22.
//

import Foundation
import SwiftUI



class GameTimer: ObservableObject{
    
    @Published var value: Int = 0
    var isStopped=false
    
    init(){

        Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ timer in
            if !self.isStopped{
            self.value+=1
            }
        }
    
    }
    

    
    func stop(){
        isStopped.toggle()
    }
}
