
//
//  Game.swift
//  Logintest
//
//  Created by Alexander Bullard (student LM) on 5/18/22.
//

import Foundation
import SwiftUI

class Game:Identifiable, ObservableObject{
    
    var id:UUID = UUID()
    @Published var sudokuBoard:Board
    var sudokuSolution:Board
    var difficulty:Int
    var timer=Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var time=0
    
    
    init(){
        difficulty=0
        sudokuSolution=Board()
        sudokuBoard=Board()
        sudokuSolution=sudokuBoard.copyBoard()
    }
    init(difficulty:Int){
        
        self.difficulty=difficulty
        sudokuSolution=Board()
        sudokuBoard=Board()
        sudokuSolution=sudokuBoard.copyBoard()
    }
    
    init(_ sBoard: String, _ sSolution: String, _ isLockedMap:String, _ sNotes: String, _ time: Int16, _ difficulty:Int16){
        
        self.time=Int(time)
        self.difficulty=Int(difficulty)
        sudokuBoard=Board(sBoard, isLockedMap, sNotes)
        sudokuSolution=Board(sSolution, isLockedMap, sNotes)
        
    }
    
    func getSolution(){
        sudokuSolution.solveBoard1()
    }
    
    func generateNewSudoku(difficulty: Int){
        
        let threshold=30+5*difficulty
        var save=0
        var numremoved=0
        var spots:[(Int,Int)]=[]
        sudokuBoard.createSolvedBoard()
        
        for i in 0...80{
            spots.append((Int(i/9),i%9))
        }
        spots.shuffle()
        var i=0
        for spot in spots{
            if numremoved<threshold{
                save=sudokuBoard.board[spot.0][spot.1].value
                sudokuBoard.board[spot.0][spot.1].value=0
                sudokuBoard.board[spot.0][spot.1].isLocked=false
                
                if !sudokuBoard.checkUnique(){
                    sudokuBoard.board[spot.0][spot.1].value=save
                    sudokuBoard.board[spot.0][spot.1].isLocked=true
                }
                else{
                    numremoved+=1
                }
                i+=1
                print("Spot \(i) checked")
                sudokuBoard.printBoard()
            }
        }
        if sudokuBoard.board[0][0].value==0{
            sudokuBoard.board[0][0].isLocked=false
        }
        else{
            sudokuBoard.board[0][0].isLocked=true
        }
        
        sudokuSolution=sudokuBoard.copyBoard()
        sudokuSolution.solveBoard1()
        
    }
    
    func checkBoard()->Bool{
        var solved=true
        for row in sudokuBoard.board{
            for cell in row{
                if !(cell.value==sudokuSolution.board[cell.row][cell.column].value){
                    solved=false
                }
            }
        }
        return solved
    }
    
    func completeBoard(){
        for row in sudokuBoard.board{
            for cell in row{
                cell.value=sudokuSolution.board[cell.row][cell.column].value
            }
        }
    }
    
    
    func getHint(){
        
        var row = Int.random(in: 0...8)
        var col = Int.random(in: 0...8)
        
        while !(sudokuBoard.board[row][col].value==0){
            row = Int.random(in: 0...8)
            col = Int.random(in: 0...8)
        }
        
        sudokuBoard.board[row][col].value=sudokuSolution.board[row][col].value
        sudokuBoard.board[row][col].isLocked=true
        
        sudokuBoard.updateNotes(row: row, col: col, value: sudokuSolution.board[row][col].value)
    }
    
    
    func checkNumsInPlace(num:Int) -> Bool{
        var count=0
        for row in sudokuBoard.board{
            for cell in row{
                if cell.value==num{
                    count+=1
                }
            }
        }
        if count==9{
            return true
        }
        else{
            return false
        }
        
        
    }
}
