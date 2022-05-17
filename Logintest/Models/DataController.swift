//
//  DataController.swift
//  Logintest
//
//  Created by Alexander Bullard (student LM) on 5/20/22.
//

import Foundation
import CoreData

class DataController:ObservableObject{
    
    let container=NSPersistentContainer(name: "SudokuModel")
    
    init(){
        container.loadPersistentStores{ desc, error in
            if let error = error {
                print("Failed to load the data: \(error.localizedDescription)")
            }
        }
        
    }
    
    func save(context: NSManagedObjectContext){
        
        do{
            try context.save()
            print("Data Saved")
        }
        catch{
            print("Data unable to be saved")
        }
        
    }
    
    func addSudoku(board: String, solvedBoard: String, isLockedMap: String, difficulty:Int, context: NSManagedObjectContext){
        let sudoku = Sudoku(context: context)
        sudoku.time=0
        sudoku.difficulty=Int16(difficulty)
        sudoku.id=UUID()
        sudoku.date=Date()
        sudoku.isLockedMap=isLockedMap
        sudoku.board=board
        sudoku.solvedBoard=solvedBoard
        sudoku.notes=""
        save(context: context)
    }
    
    func editSudoku(sudoku: Sudoku, board: String, solvedBoard: String, isLockedMap:String, notes:String, time:Int, context: NSManagedObjectContext){
        sudoku.board=board
        sudoku.date=Date()
        sudoku.isLockedMap=isLockedMap
        sudoku.solvedBoard=solvedBoard
        sudoku.notes=notes
        sudoku.time=Int16(time)
        save(context: context)
    }
    
    func addHighscore(difficulty:Int, time:Int, context: NSManagedObjectContext){
        let highscore = Highscore(context: context)
        highscore.time=Int16(time)
        highscore.difficulty=Int16(difficulty)
        save(context: context)
    }
    
    func editHighscore(highscore: Highscore, time: Int, context: NSManagedObjectContext){
        highscore.time=Int16(time)
        save(context: context)
    }

    
}
