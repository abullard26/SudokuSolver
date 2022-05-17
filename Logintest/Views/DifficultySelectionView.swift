//
//  DifficultySelectionView.swift
//  Logintest
//
//  Created by Alexander Bullard (student LM) on 5/29/22.
//

import Foundation
import SwiftUI

struct DifficultySelectionView:View{
    
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.difficulty, order: .reverse)]) var highscores: FetchedResults<Highscore>
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var savedSudokus: FetchedResults<Sudoku>
    @Binding var game:Game
    @Binding var gameStarted:Bool
    @Binding var startingNewGame:Bool
    @Binding var difficulty:Int
    @State var clicked=false
    var difficultyList=["Very Easy", "Easy", "Medium", "Hard", "Very Hard"]
    
    var body: some View{
        
        ZStack{
            Color.black.opacity(0.9).edgesIgnoringSafeArea(.all)
            
            VStack{
                HStack{
                    Spacer()
                    Button(action:{
                        startingNewGame=false
                    }){
                        Text("X")
                            .font(.system(size: 30, weight: .heavy))
                            .padding(30)
                            .foregroundColor(Color("NeonOrange"))
                            .shadow(color: Color("NeonOrangeShadow"), radius: 10, x: 0, y: 0)
                            .shadow(color: Color("NeonOrangeShadow"), radius: 10, x: 0, y: 0)
                            .shadow(color: Color("NeonOrangeShadow"), radius: 10, x: 0, y: 0)
                    }
                }
                Spacer()
                Group{
                    HStack{
                        Text("Difficulty: \(difficultyList[difficulty])")
                            .bold()
                            .font(.system(size: 25, weight: .medium    ))
                            .foregroundColor(Color("Neon"))
                            .shadow(color: Color("NeonShadow"), radius: 20, x: 0, y: 0)
                            .shadow(color: Color("NeonShadow"), radius: 20, x: 0, y: 0)
                            .shadow(color: Color("NeonShadow"), radius: 20, x: 0, y: 0)
                        
                        Spacer()
                        
                        Button(action:{
                            if difficulty<4{
                                difficulty+=1
                                clicked.toggle()
                            }
                        }){
                            Image(systemName: "plus")
                                .font(.system(size: 30, weight: .heavy))
                                .foregroundColor(Color("NeonOrange"))
                                .shadow(color: Color("NeonOrangeShadow"), radius: 10, x: 0, y: 0)
                                .shadow(color: Color("NeonOrangeShadow"), radius: 10, x: 0, y: 0)
                                .shadow(color: Color("NeonOrangeShadow"), radius: 10, x: 0, y: 0)
                        }
                        
                        Button(action:{
                            if difficulty>0{
                                difficulty-=1
                                clicked.toggle()
                            }
                        }){
                            Image(systemName: "minus")
                                .font(.system(size: 30, weight: .heavy))
                                .foregroundColor(Color("NeonOrange"))
                                .shadow(color: Color("NeonOrangeShadow"), radius: 10, x: 0, y: 0)
                                .shadow(color: Color("NeonOrangeShadow"), radius: 10, x: 0, y: 0)
                                .shadow(color: Color("NeonOrangeShadow"), radius: 10, x: 0, y: 0)
                        }
                        
                    }.background(NeonSignView())
                }.frame(width: 250, height: 100, alignment: .center).padding(30)
                
                VStack{
                    Button(action:{
                        game=Game(difficulty: difficulty)
                        game.generateNewSudoku(difficulty: game.difficulty)
                        for sudoku in savedSudokus{
                            managedObjContext.delete(sudoku)
                            DataController().save(context: managedObjContext)
                        }
                        DataController().addSudoku(
                            board: game.sudokuBoard.getBoardAsString(),
                            solvedBoard: game.sudokuSolution.getBoardAsString(),
                            isLockedMap: game.sudokuBoard.getIsLockedAsString(),
                            difficulty: game.difficulty,
                            context: managedObjContext)
                        gameStarted=true
                        startingNewGame.toggle()
                    }){
                        Text("Start")
                            .font(.system(size: 30, weight: .heavy))
                            .foregroundColor(Color("NeonOrange"))
                            .shadow(color: Color("NeonOrangeShadow"), radius: 10, x: 0, y: 0)
                            .shadow(color: Color("NeonOrangeShadow"), radius: 10, x: 0, y: 0)
                            .shadow(color: Color("NeonOrangeShadow"), radius: 10, x: 0, y: 0)
                    }
                    
                }
                Spacer()
            }
        }
    }
}
