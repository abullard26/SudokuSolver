//
//  SudokuCellView.swift
//  Logintest
//
//  Created by Alexander Bullard (student LM) on 5/18/22.
//

import Foundation
import SwiftUI

struct SudokuCellView:View{
    @Binding var cell:Cell
    @Binding var game:Game
    @Binding var selected:Bool
    let columns:[GridItem]=Array(repeating: GridItem(.flexible(), spacing: 0), count:3)
    var body: some View{
        Button(action:{
            
            
            
            if !cell.isSelected{
                selected.toggle()
                cell.isSelected.toggle()
            }
            
            for row in game.sudokuBoard.board{
                for item in row{
                    if item.isSelected && !(item.id==self.cell.id){
                        item.isSelected.toggle()
                        selected.toggle()
                    }
                    
                }
            }
            
            if !(cell.value==0) && cell.isLocked{
                for row in game.sudokuBoard.board{
                    for item in row{
                        if ((item.value==cell.value&&item.value==game.sudokuSolution.board[item.row][item.column].value) || (item.notes.contains(cell.value)&&item.value==0)) && !(item.id==self.cell.id) {
                            item.isSelected.toggle()
                            selected.toggle()
                        }
                    }
                }
            }
            else{
                
            }
            
        }){
            ZStack{
                if cell.value==0{
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(cell.isSelected ? Color("NeonOrange"):Color("NeonClear"), lineWidth: cell.isSelected ? 1:2)
                            .blur(radius: cell.isSelected ? 0:1)
                            .frame(width: 65.5*UIScreen.main.bounds.width/720, height: 65.5*UIScreen.main.bounds.width/720, alignment:.center)
                            .foregroundColor(Color.clear)
                            .shadow(color: cell.isSelected ? Color("NeonOrangeShadow"):Color("NeonClear") , radius: cell.isSelected ? 1:1, x: 0, y: 0)
                            .shadow(color: cell.isSelected ? Color("NeonOrangeShadow"):Color("NeonClear") , radius: cell.isSelected ? 1:0, x: 0, y: 0)
                        LazyVGrid(columns:columns, spacing: 0 ){
                            ForEach(0..<cell.notes.count, id:\.self){ i in
                                Text("\(cell.notes[i])")
                                    .font(.system(size: UIScreen.main.bounds.width*0.02))
                                    .foregroundColor(Color("NeonOrange"))
                                    .bold()
                                    .shadow(color: Color("NeonOrangeShadow"), radius: 3, x: 0, y: 0)
                                    .shadow(color: Color("NeonOrangeShadow"), radius: 3, x: 0, y: 0)
                            }
                        }
                    }
                }
                else if cell.value==game.sudokuSolution.board[cell.row][cell.column].value{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(cell.isSelected ? Color("NeonOrange"):Color("Neon"), lineWidth: cell.isSelected ? 3:1)
                        .frame(width: 65.5*UIScreen.main.bounds.width/720, height: 65.5*UIScreen.main.bounds.width/720, alignment: .center)
                        .foregroundColor(Color.clear)
                        .shadow(color: cell.isSelected ? Color("NeonOrangeShadow"):Color("Neon") , radius: cell.isSelected ? 10:1, x: 0, y: 0)
                        .shadow(color: cell.isSelected ? Color("NeonOrangeShadow"):Color("Neon") , radius: cell.isSelected ? 10:1, x: 0, y: 0)
                }
                else{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(cell.isSelected ? Color("NeonOrange"):Color("Neon"), lineWidth: cell.isSelected ? 3:1)
                        .frame(width: 65.5*UIScreen.main.bounds.width/720, height: 65.5*UIScreen.main.bounds.width/720, alignment: .center)
                        .foregroundColor(Color.clear)
                        .shadow(color: cell.isSelected ? Color("NeonOrangeShadow"):Color("Neon") , radius: cell.isSelected ? 10:1, x: 0, y: 0)
                        .shadow(color: cell.isSelected ? Color("NeonOrangeShadow"):Color("Neon") , radius: cell.isSelected ? 10:1, x: 0, y: 0)
                }
                if !(cell.value==0)&&cell.value==game.sudokuSolution.board[cell.row][cell.column].value{
                    Text("\(cell.value)")
                        .foregroundColor(Color("Neon"))
                        .bold()
                        .shadow(color: Color("NeonShadow"), radius: 3, x: 0, y: 0)
                        .shadow(color: Color("NeonShadow"), radius: 3, x: 0, y: 0)
                }
                else if !(cell.value==0){
                    Text("\(cell.value)")
                        .foregroundColor(Color.red).bold()
                        .shadow(color: Color.red, radius: 10, x: 0, y: 0)
                        .shadow(color: Color.red, radius: 10, x: 0, y: 0)
                }
            }
        }.padding(UIScreen.main.bounds.width/144)
    }
}
