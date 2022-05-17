//
//  LogintestApp.swift
//  Logintest
//
//  Created by Alexander Bullard (student LM) on 5/17/22.
//

import SwiftUI

@main
struct SudokuSolverNeonApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, dataController.container.viewContext).environmentObject(Game())
        }
    }
}
