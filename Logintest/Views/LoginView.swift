//
//  LoginView.swift
//  Logintest
//
//  Created by Alexander Bullard (student LM) on 5/17/22.
//

import Foundation
import SwiftUI

struct LoginView: View{
    
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.difficulty, order: .reverse)]) var highscores: FetchedResults<Highscore>
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var savedSudokus: FetchedResults<Sudoku>
    @Binding var verified:Bool
    @State var game:Game=Game()
    @State var gameStarted:Bool=false
    @State var difficulty:Int=0
    @State var clicked=false
    @State var startingNewGame=false
    @State var value=0
    
    var difficultyList=["Very Easy", "Easy", "Medium", "Hard", "Very Hard"]


    var body: some View{
        if !gameStarted{
            ZStack{
                Color.black.edgesIgnoringSafeArea(.all)
                VStack{
                    HStack{
                        Button(action:{
                            verified=false
                        }){
                            
                            Text("Back")
                                .bold()
                                .font(.system(size: UIScreen.main.bounds.width*0.036))
                                .padding(.leading, UIScreen.main.bounds.width*0.05)
                                .foregroundColor(Color("NeonOrange"))
                                .shadow(color: Color("NeonOrangeShadow"), radius: 10, x: 0, y: 0)
                                .shadow(color: Color("NeonOrangeShadow"), radius: 10, x: 0, y: 0)
                                .shadow(color: Color("NeonOrangeShadow"), radius: 10, x: 0, y: 0)
                            
                        }
                        Spacer()
                    }
                    ScoreBoardView()
                    ZStack{
                        NeonSignView()
                        VStack{
                            
                            
                            
                            Button(action:{
                                startingNewGame=true
                            }){
                                Text("Create Sudoku")
                                    .bold()
                                    .font(.system(size: UIScreen.main.bounds.width*0.072))
                                    .foregroundColor(Color("NeonOrange"))
                                    .shadow(color: Color("NeonOrangeShadow"), radius: 10, x: 0, y: 0)
                                    .shadow(color: Color("NeonOrangeShadow"), radius: 10, x: 0, y: 0)
                                    .shadow(color: Color("NeonOrangeShadow"), radius: 10, x: 0, y: 0)
                            }.frame(width: UIScreen.main.bounds.width*0.725, height: UIScreen.main.bounds.width*0.1, alignment: .center)
                            
                            let isSavedGame = savedSudokus.count>0
                            Button(action:{
                                if savedSudokus.count > 0{
                                    for sudoku in savedSudokus{
                                        game=Game(sudoku.board!, sudoku.solvedBoard!, sudoku.isLockedMap!, sudoku.notes!, sudoku.time, sudoku.difficulty)
                                        break
                                    }
                                    
                                    gameStarted=true
                                }
                            }){
                                Text("Continue Sudoku")
                                    .bold()
                                    .font(.system(size: UIScreen.main.bounds.width*0.072))
                                    .foregroundColor(Color("NeonOrange"))
                                    .opacity(isSavedGame ? 1:0.1)
                                    .shadow(color: Color("NeonOrangeShadow"), radius: isSavedGame ? 10:0, x: 0, y: 0)
                                    .shadow(color: Color("NeonOrangeShadow"), radius: isSavedGame ? 10:0, x: 0, y: 0)
                                    .shadow(color: Color("NeonOrangeShadow"), radius: isSavedGame ? 10:0, x: 0, y: 0)
                                    .padding(.top, UIScreen.main.bounds.width*0.05)
                                
                            }
                        }
                    }
                    
                }
                if startingNewGame{
                    DifficultySelectionView(game:$game, gameStarted: $gameStarted, startingNewGame: $startingNewGame, difficulty: $difficulty)
                }
            }
        }
        else{
            ZStack{
                Color.black.edgesIgnoringSafeArea(.all)
                SudokuView(game:$game,  gameStarted: $gameStarted)
            }
        }
    }
}
