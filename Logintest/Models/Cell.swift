//
//  Cell.swift
//  Logintest
//
//  Created by Alexander Bullard (student LM) on 5/18/22.
//

import Foundation
import SwiftUI

class Cell: Identifiable{
    
    var id=UUID()
    var row:Int
    var column:Int
    var value:Int=0
    var hasValue=false
    var isLocked=false
    var isSelected=false
    var notes:[Int]=[]
    
    init(_ row:Int, _ column:Int){
        self.row=row
        self.column=column
        //self.value=Int.random(in: 0..<10)
    }
    
    init(_ row:Int, _ column:Int, _ value:Int){
        self.row=row
        self.column=column
        self.value=value
        //self.value=Int.random(in: 0..<10)
    }
    init(_ row:Int, _ column:Int, _ value:Int, _ isLocked:Bool){
        self.row=row
        self.column=column
        self.value=value
        self.isLocked=isLocked
        //self.value=Int.random(in: 0..<10)
    }
    
    func addToNotes(value:Int){
        var add=true
        for num in notes{
            if value == num{
                notes.remove(at: notes.firstIndex(of: value)!)
                add=false
            }
        }
        if add{
            notes.append(value)
            notes=notes.sorted()
        }
    }
    
}
