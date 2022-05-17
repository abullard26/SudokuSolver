//
//  SudokuView.swift
//  Logintest
//
//  Created by Alexander Bullard (student LM) on 5/18/22.
//

import Foundation
import SwiftUI


enum SudokuButton:Int{
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    case nine = 9
}


struct SudokuView:View{
    
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var savedSudokus: FetchedResults<Sudoku>
    @FetchRequest(sortDescriptors: [SortDescriptor(\.difficulty, order: .reverse)]) var highscores: FetchedResults<Highscore>
    @State var noteMode:Bool = false
    @Binding var game:Game
    @Binding var gameStarted:Bool
    @State var selected=false
    @State var time=0
    @State var isSolved=false
    var sudokubuttons: [[SudokuButton]] = [[.one,.two,.three,.four,.five,.six],[.seven,.eight,.nine]]
    
    func getFormatedTime(time:Int)->String{
        
        let minutes = Int(time)/60
        
        if time-minutes*60<10{
            return "\(minutes):0\(time-minutes*60)"
        }
        
        return "\(minutes):\(time-minutes*60)"
    }
    
    func endGame(){
        print("True")
        var isContained=false
        for score in highscores{
            if game.difficulty==score.difficulty{
                isContained=true
                if game.time < score.time{
                    DataController().editHighscore(highscore: score, time: game.time, context: managedObjContext)
                }
            }
        }
        if !isContained{
            DataController().addHighscore(difficulty: game.difficulty, time: game.time, context: managedObjContext)
        }
        
        for sudoku in savedSudokus{
            managedObjContext.delete(sudoku)
            DataController().save(context: managedObjContext)
        }
        
    }
    
    var body: some View{
        let columns:[GridItem]=Array(repeating: GridItem(.flexible(), spacing: 1), count:9)
        
        VStack{
            Spacer()
            ZStack{
                
                VStack{
                    Spacer()
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width, height: 2, alignment: .top)
                        .foregroundColor(Color("Neon")).shadow(color: Color("NeonShadow"), radius: 10, x: 0, y: 0)
                        .shadow(color: Color("NeonShadow"), radius: 10, x: 0, y: 0)
                    //Spacer(minLength:UIScreen.main.bounds.height*0.15)
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width, height: 2, alignment: .top)
                        .foregroundColor(Color("Neon"))
                        .padding(.top, UIScreen.main.bounds.width*0.30)
                        .shadow(color: Color("NeonShadow"), radius: 10, x: 0, y: 0)
                        .shadow(color: Color("NeonShadow"), radius: 10, x: 0, y: 0)
                    Spacer()
                }
                HStack{
                    Rectangle()
                        .frame(width: 2, height: UIScreen.main.bounds.width, alignment: .top)
                        .foregroundColor(Color("Neon"))
                        .shadow(color: Color("NeonShadow"), radius: 10, x: 0, y: 0)
                        .shadow(color: Color("NeonShadow"), radius: 10, x: 0, y: 0)
                    Spacer()
                    Rectangle()
                        .frame(width: 2, height: UIScreen.main.bounds.width, alignment: .top)
                        .foregroundColor(Color("Neon"))
                        .shadow(color: Color("NeonShadow"), radius: 10, x: 0, y: 0)
                        .shadow(color: Color("NeonShadow"), radius: 10, x: 0, y: 0)
                    Spacer()
                    Rectangle()
                        .frame(width: 2, height: UIScreen.main.bounds.width, alignment: .top)
                        .foregroundColor(Color("Neon"))
                        .shadow(color: Color("NeonShadow"), radius: 10, x: 0, y: 0)
                        .shadow(color: Color("NeonShadow"), radius: 10, x: 0, y: 0)
                    Spacer()
                    Rectangle()
                        .frame(width: 2, height: UIScreen.main.bounds.width, alignment: .top)
                        .foregroundColor(Color("Neon"))
                        .shadow(color: Color("NeonShadow"), radius: 10, x: 0, y: 0)
                        .shadow(color: Color("NeonShadow"), radius: 10, x: 0, y: 0)
                }
                
                VStack{
                    Spacer()
                    NeonLineView(color:Color("NeonShadow"), width:UIScreen.main.bounds.width*1.02, rotation:0.0, vertical: false)
                    Spacer(minLength: UIScreen.main.bounds.width*0.98)
                    NeonLineView(color:Color("NeonShadow"), width:UIScreen.main.bounds.width*1.02, rotation:0.0, vertical: false)
                    Spacer()
                }
                
                LazyVGrid(columns: columns, spacing:0){
                    ForEach((0...80), id: \.self){ i in
                        let row=Int(i/9)
                        let column=i%9

                        SudokuCellView(cell: $game.sudokuBoard.board[row][column], game: $game, selected: $selected).padding(.trailing, i%3==2 ? UIScreen.main.bounds.width/160:0).padding(.bottom, (row%3==2 && !(row==8)) ? UIScreen.main.bounds.width/80:0).padding(.leading, i%3==0 ? UIScreen.main.bounds.width/160:0)
                        
                    }
                }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width, alignment: .center)
            }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width+15, alignment: .center)
            Spacer(minLength: UIScreen.main.bounds.height*0.28)
        }
        VStack{
            HStack{
                Button(action: {
                    
                    gameStarted.toggle()
                    
                    DataController().editSudoku(
                        sudoku: savedSudokus[0],
                        board: game.sudokuBoard.getBoardAsString(),
                        solvedBoard: game.sudokuSolution.getBoardAsString(),
                        isLockedMap: game.sudokuBoard.getIsLockedAsString(),
                        notes: game.sudokuBoard.getNotesAsString(),
                        time: game.time,
                        context: managedObjContext)
                    
                }){
                    Text("Exit Game")
                        .bold()
                        .font(.system(size: UIScreen.main.bounds.width*0.05))
                        .foregroundColor(Color("NeonOrange"))
                        .shadow(color: Color("NeonOrangeShadow"), radius: 10, x: 0, y: 0)
                        .shadow(color: Color("NeonOrangeShadow"), radius: 10, x: 0, y: 0)
                        .padding(.leading, 10)
                }
                
                Spacer()
                
                Text("Game Clock - \(getFormatedTime(time:time))")
                    .bold()
                    .font(.system(size: 20))
                    .foregroundColor(Color("NeonOrange"))
                    .shadow(color: Color("NeonOrangeShadow"), radius: 10, x: 0, y: 0)
                    .shadow(color: Color("NeonOrangeShadow"), radius: 10, x: 0, y: 0)
                    .padding(.trailing, 10)
                    .onReceive(game.timer, perform: { _ in
                        
                        if time==0{
                            time=game.time
                        }
                        
                        if !game.checkBoard(){
                            time+=1
                            game.time+=1
                        }
                        else{
                            isSolved=true
                        }
                    })
                
            }
            Spacer()
            HStack{
                Button(action: {noteMode.toggle()}){
                    
                    if noteMode{
                        Image("NoteOn")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width*0.121, height: UIScreen.main.bounds.width*0.121, alignment: .leading)
                            .shadow(color: Color.green, radius: 10, x: 0, y: 0)
                            .shadow(color: Color.green, radius: 10, x: 0, y: 0)
                    }
                    else{
                        Image("NoteOff")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width*0.121, height: UIScreen.main.bounds.width*0.121, alignment: .leading)
                            .shadow(color: Color.red, radius: 10, x: 0, y: 0)
                            .shadow(color: Color.red, radius: 10, x: 0, y: 0)
                    }
                    
                }
                
                Button(action: {
                    game.getHint()
                    DataController().editSudoku(
                        sudoku: savedSudokus[0],
                        board: game.sudokuBoard.getBoardAsString(),
                        solvedBoard: game.sudokuSolution.getBoardAsString(),
                        isLockedMap: game.sudokuBoard.getIsLockedAsString(),
                        notes: game.sudokuBoard.getNotesAsString(),
                        time: game.time,
                        context: managedObjContext)
                }){
                    
                    Image("Lightbulb")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width*0.121, height: UIScreen.main.bounds.width*0.121, alignment: .leading)
                        .shadow(color: Color.yellow, radius: 10, x: 0, y: 0)
                        .shadow(color: Color.yellow, radius: 10, x: 0, y: 0)
                    
                }
                
                Spacer()
            }
            ForEach(sudokubuttons, id:\.self){row in
                HStack{
                    ForEach(row, id:\.self){ item in
                        var placed = false
                        Button(action:{
                            if !game.checkNumsInPlace(num: item.rawValue){
                                game.sudokuBoard.printBoard()
                                print(game.sudokuBoard.getIsLockedAsString())
                                for row in game.sudokuBoard.board{
                                    for cell in row{
                                        if cell.isSelected && !cell.isLocked && !noteMode{
                                            if cell.value==item.rawValue{
                                                cell.value=0
                                            }
                                            else{
                                                if !placed{
                                                    cell.value=item.rawValue
                                                }
                                                placed=true
                                                
                                                if cell.value==game.sudokuSolution.board[cell.row][cell.column].value{
                                                    cell.isLocked=true
                                                    game.sudokuBoard.updateNotes(row: cell.row, col: cell.column, value: cell.value)
                                                    for row in game.sudokuBoard.board{
                                                        for spot in row{
                                                            if ((spot.value==item.rawValue && spot.value == game.sudokuSolution.board[spot.row][spot.column].value) || (spot.notes.contains(item.rawValue)&&spot.value==0)) {
                                                                spot.isSelected=true
                                                            }
                                                            
                                                        }
                                                    }
                                                    cell.notes=[]
                                                }
                                            }
                                        }
                                        else if cell.isSelected && !cell.isLocked{
                                            cell.addToNotes(value: item.rawValue)
                                        }
                                    }
                                }
                                DataController().editSudoku(
                                    sudoku: savedSudokus[0],
                                    board: game.sudokuBoard.getBoardAsString(),
                                    solvedBoard: game.sudokuSolution.getBoardAsString(),
                                    isLockedMap: game.sudokuBoard.getIsLockedAsString(),
                                    notes: game.sudokuBoard.getNotesAsString(),
                                    time: game.time,
                                    context: managedObjContext)
                                selected.toggle()
                            }
                        }){
                            ZStack{
                                Rectangle()
                                    .foregroundColor(Color.clear).border(!game.checkNumsInPlace(num: item.rawValue) ? Color("Neon"): Color.gray, width: 5)
                                    .frame(width: UIScreen.main.bounds.width*0.143, height: UIScreen.main.bounds.width*0.143, alignment: .center)
                                    .cornerRadius(10)
                                    .shadow(color: !game.checkNumsInPlace(num: item.rawValue) ? Color("NeonShadow"): Color.gray, radius: 10, x: 0, y: 0)
                                    .shadow(color: !game.checkNumsInPlace(num: item.rawValue) ? Color("NeonShadow"): Color.gray, radius: 10, x: 0, y: 0)
                                Text("\(item.rawValue)").bold().foregroundColor(!game.checkNumsInPlace(num: item.rawValue) ? Color.white:Color.gray)
                            }
                        }
                    }
                }
            }
        }
        if isSolved {
            EndGameView(game: $game, gameStarted: $gameStarted).onAppear(perform: endGame)
        }
    }
}

