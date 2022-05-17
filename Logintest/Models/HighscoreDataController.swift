//
//  HighscoreDataController.swift
//  Logintest
//
//  Created by Alexander Bullard (student LM) on 5/27/22.
//

/*import Foundation
import CoreData

class HighscoreDataController:ObservableObject{
    
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
*/
