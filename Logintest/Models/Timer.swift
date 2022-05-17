//
//  Timer.swift
//  Logintest
//
//  Created by Alexander Bullard (student LM) on 5/18/22.
//

import Foundation
import SwiftUI
import Combine


class LockTimer: ObservableObject{
    
    @Published var value: Int = 0
    
    init(){
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ timer in
            self.value-=1
        }
        
    }
}


