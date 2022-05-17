//
//  Board.swift
//  Logintest
//
//  Created by Alexander Bullard (student LM) on 5/19/22.
//

import Foundation


class Board{
    var board:[[Cell]]=[]
    
    init(){
        var temp:[Cell]=[]
        for i in 0...8{
            temp=[]
            for j in 0...8{
                temp.append(Cell(i,j))
            }
            board.append(temp)
        }
    }
    
    init(_ sBoard:String, _ isLockedMap:String, _ sNotes:String){
        
        var temp:[Cell]=[]
        for i in 0...8{
            temp=[]
            for j in 0...8{
                temp.append(Cell(i,j))
            }
            board.append(temp)
        }
        var row=0
        var col=0
        var num=0
        var isLocked:Int
        var index1:String.Index
        var index2:String.Index
        var index3:String.Index
        var index4:String.Index
        let notesList=sNotes.split(separator: "0")
        for i in 0...80{
            
            index1=sBoard.index(sBoard.startIndex, offsetBy: i)
            index2=sBoard.index(sBoard.startIndex, offsetBy: i+1)
            num = Int(sBoard[index1..<index2]) ?? 0
            isLocked = Int(isLockedMap[index1..<index2]) ?? 0
            row = Int(i/9)
            col = i%9
            
            board[row][col].value=num
            
            if isLocked==1{
                board[row][col].isLocked=true
            }
            else{
                board[row][col].isLocked=false
            }
            
            for j in 1..<notesList[i].count{
            index3=notesList[i].index(notesList[i].startIndex, offsetBy:j)
            index4=notesList[i].index(notesList[i].startIndex, offsetBy:j+1)
            num = Int(notesList[i][index3..<index4]) ?? 0
            board[row][col].notes.append(num)
            }
        }
    }
    
    init(difficulty:Int){
        
        if difficulty==1{
            board=[
                [Cell(0,0,7),Cell(0,1,6),Cell(0,2,0),Cell(0,3,2),Cell(0,4,9),Cell(0,5,4),Cell(0,6,0),Cell(0,7,1),Cell(0,8,0)],
                [Cell(1,0,9),Cell(1,1,0),Cell(1,2,3),Cell(1,3,6),Cell(1,4,0),Cell(1,5,1),Cell(1,6,0),Cell(1,7,5),Cell(1,8,2)],
                [Cell(2,0,0),Cell(2,1,0),Cell(2,2,2),Cell(2,3,0),Cell(2,4,0),Cell(2,5,5),Cell(2,6,0),Cell(2,7,0),Cell(2,8,0)],
                [Cell(3,0,8),Cell(3,1,3),Cell(3,2,4),Cell(3,3,7),Cell(3,4,0),Cell(3,5,0),Cell(3,6,5),Cell(3,7,2),Cell(3,8,1)],
                [Cell(4,0,0),Cell(4,1,5),Cell(4,2,0),Cell(4,3,1),Cell(4,4,2),Cell(4,5,8),Cell(4,6,0),Cell(4,7,0),Cell(4,8,3)],
                [Cell(5,0,2),Cell(5,1,0),Cell(5,2,9),Cell(5,3,4),Cell(5,4,0),Cell(5,5,3),Cell(5,6,6),Cell(5,7,0),Cell(5,8,7)],
                [Cell(6,0,0),Cell(6,1,9),Cell(6,2,1),Cell(6,3,0),Cell(6,4,8),Cell(6,5,0),Cell(6,6,0),Cell(6,7,7),Cell(6,8,0)],
                [Cell(7,0,4),Cell(7,1,0),Cell(7,2,6),Cell(7,3,9),Cell(7,4,1),Cell(7,5,7),Cell(7,6,8),Cell(7,7,3),Cell(7,8,5)],
                [Cell(8,0,0),Cell(8,1,0),Cell(8,2,8),Cell(8,3,3),Cell(8,4,4),Cell(8,5,0),Cell(8,6,0),Cell(8,7,0),Cell(8,8,6)],
            ]
        }
        if difficulty==2{
            board=[
                [Cell(0,0,4),Cell(0,1,8),Cell(0,2,9),Cell(0,3,0),Cell(0,4,0),Cell(0,5,0),Cell(0,6,7),Cell(0,7,0),Cell(0,8,2)],
                [Cell(1,0,0),Cell(1,1,0),Cell(1,2,6),Cell(1,3,3),Cell(1,4,0),Cell(1,5,0),Cell(1,6,0),Cell(1,7,9),Cell(1,8,1)],
                [Cell(2,0,1),Cell(2,1,3),Cell(2,2,2),Cell(2,3,0),Cell(2,4,0),Cell(2,5,0),Cell(2,6,0),Cell(2,7,5),Cell(2,8,0)],
                [Cell(3,0,0),Cell(3,1,0),Cell(3,2,3),Cell(3,3,7),Cell(3,4,8),Cell(3,5,4),Cell(3,6,6),Cell(3,7,0),Cell(3,8,0)],
                [Cell(4,0,8),Cell(4,1,0),Cell(4,2,7),Cell(4,3,0),Cell(4,4,2),Cell(4,5,6),Cell(4,6,0),Cell(4,7,0),Cell(4,8,0)],
                [Cell(5,0,6),Cell(5,1,0),Cell(5,2,0),Cell(5,3,5),Cell(5,4,1),Cell(5,5,0),Cell(5,6,0),Cell(5,7,8),Cell(5,8,0)],
                [Cell(6,0,3),Cell(6,1,4),Cell(6,2,0),Cell(6,3,0),Cell(6,4,5),Cell(6,5,9),Cell(6,6,2),Cell(6,7,0),Cell(6,8,0)],
                [Cell(7,0,0),Cell(7,1,0),Cell(7,2,0),Cell(7,3,2),Cell(7,4,0),Cell(7,5,1),Cell(7,6,0),Cell(7,7,4),Cell(7,8,9)],
                [Cell(8,0,0),Cell(8,1,0),Cell(8,2,5),Cell(8,3,0),Cell(8,4,7),Cell(8,5,0),Cell(8,6,1),Cell(8,7,0),Cell(8,8,0)],
            ]
        }
        if difficulty==3{
            board=[
                [Cell(0,0,1),Cell(0,1,3),Cell(0,2,0),Cell(0,3,0),Cell(0,4,0),Cell(0,5,0),Cell(0,6,2),Cell(0,7,7),Cell(0,8,0)],
                [Cell(1,0,9),Cell(1,1,0),Cell(1,2,6),Cell(1,3,7),Cell(1,4,2),Cell(1,5,3),Cell(1,6,8),Cell(1,7,1),Cell(1,8,0)],
                [Cell(2,0,0),Cell(2,1,0),Cell(2,2,5),Cell(2,3,0),Cell(2,4,0),Cell(2,5,9),Cell(2,6,0),Cell(2,7,0),Cell(2,8,4)],
                [Cell(3,0,0),Cell(3,1,0),Cell(3,2,0),Cell(3,3,2),Cell(3,4,0),Cell(3,5,0),Cell(3,6,0),Cell(3,7,0),Cell(3,8,0)],
                [Cell(4,0,4),Cell(4,1,0),Cell(4,2,0),Cell(4,3,0),Cell(4,4,5),Cell(4,5,0),Cell(4,6,0),Cell(4,7,2),Cell(4,8,1)],
                [Cell(5,0,7),Cell(5,1,0),Cell(5,2,0),Cell(5,3,0),Cell(5,4,0),Cell(5,5,0),Cell(5,6,6),Cell(5,7,8),Cell(5,8,0)],
                [Cell(6,0,0),Cell(6,1,0),Cell(6,2,0),Cell(6,3,3),Cell(6,4,0),Cell(6,5,4),Cell(6,6,0),Cell(6,7,5),Cell(6,8,0)],
                [Cell(7,0,0),Cell(7,1,1),Cell(7,2,0),Cell(7,3,9),Cell(7,4,0),Cell(7,5,0),Cell(7,6,0),Cell(7,7,0),Cell(7,8,0)],
                [Cell(8,0,0),Cell(8,1,8),Cell(8,2,0),Cell(8,3,0),Cell(8,4,7),Cell(8,5,0),Cell(8,6,0),Cell(8,7,0),Cell(8,8,6)],
            ]
        }
        if difficulty==4{
            board=[
                [Cell(0,0,0),Cell(0,1,0),Cell(0,2,0),Cell(0,3,0),Cell(0,4,8),Cell(0,5,0),Cell(0,6,6),Cell(0,7,3),Cell(0,8,9)],
                [Cell(1,0,2),Cell(1,1,1),Cell(1,2,3),Cell(1,3,4),Cell(1,4,0),Cell(1,5,0),Cell(1,6,0),Cell(1,7,0),Cell(1,8,0)],
                [Cell(2,0,0),Cell(2,1,0),Cell(2,2,8),Cell(2,3,5),Cell(2,4,0),Cell(2,5,0),Cell(2,6,0),Cell(2,7,0),Cell(2,8,0)],
                [Cell(3,0,4),Cell(3,1,0),Cell(3,2,0),Cell(3,3,0),Cell(3,4,0),Cell(3,5,0),Cell(3,6,1),Cell(3,7,2),Cell(3,8,0)],
                [Cell(4,0,1),Cell(4,1,3),Cell(4,2,0),Cell(4,3,7),Cell(4,4,5),Cell(4,5,0),Cell(4,6,0),Cell(4,7,0),Cell(4,8,0)],
                [Cell(5,0,0),Cell(5,1,6),Cell(5,2,0),Cell(5,3,1),Cell(5,4,4),Cell(5,5,0),Cell(5,6,5),Cell(5,7,8),Cell(5,8,0)],
                [Cell(6,0,0),Cell(6,1,0),Cell(6,2,0),Cell(6,3,0),Cell(6,4,0),Cell(6,5,0),Cell(6,6,0),Cell(6,7,9),Cell(6,8,0)],
                [Cell(7,0,0),Cell(7,1,0),Cell(7,2,0),Cell(7,3,0),Cell(7,4,0),Cell(7,5,0),Cell(7,6,0),Cell(7,7,0),Cell(7,8,0)],
                [Cell(8,0,5),Cell(8,1,4),Cell(8,2,0),Cell(8,3,0),Cell(8,4,0),Cell(8,5,9),Cell(8,6,2),Cell(8,7,0),Cell(8,8,0)],
            ]
        }
        if difficulty==5{
            board=[
                [Cell(0,0,9),Cell(0,1,0),Cell(0,2,6),Cell(0,3,0),Cell(0,4,0),Cell(0,5,4),Cell(0,6,0),Cell(0,7,8),Cell(0,8,0)],
                [Cell(1,0,1),Cell(1,1,8),Cell(1,2,0),Cell(1,3,0),Cell(1,4,0),Cell(1,5,7),Cell(1,6,0),Cell(1,7,0),Cell(1,8,2)],
                [Cell(2,0,2),Cell(2,1,0),Cell(2,2,0),Cell(2,3,0),Cell(2,4,0),Cell(2,5,1),Cell(2,6,0),Cell(2,7,0),Cell(2,8,7)],
                [Cell(3,0,0),Cell(3,1,0),Cell(3,2,0),Cell(3,3,0),Cell(3,4,0),Cell(3,5,2),Cell(3,6,6),Cell(3,7,0),Cell(3,8,0)],
                [Cell(4,0,0),Cell(4,1,0),Cell(4,2,0),Cell(4,3,7),Cell(4,4,0),Cell(4,5,0),Cell(4,6,0),Cell(4,7,0),Cell(4,8,0)],
                [Cell(5,0,0),Cell(5,1,6),Cell(5,2,4),Cell(5,3,0),Cell(5,4,0),Cell(5,5,9),Cell(5,6,7),Cell(5,7,0),Cell(5,8,0)],
                [Cell(6,0,0),Cell(6,1,0),Cell(6,2,0),Cell(6,3,1),Cell(6,4,4),Cell(6,5,6),Cell(6,6,3),Cell(6,7,0),Cell(6,8,0)],
                [Cell(7,0,0),Cell(7,1,0),Cell(7,2,0),Cell(7,3,0),Cell(7,4,2),Cell(7,5,8),Cell(7,6,0),Cell(7,7,0),Cell(7,8,4)],
                [Cell(8,0,0),Cell(8,1,0),Cell(8,2,0),Cell(8,3,3),Cell(8,4,0),Cell(8,5,0),Cell(8,6,0),Cell(8,7,0),Cell(8,8,0)],
            ]
        }
        for row in board{
            for cell in row{
                if !(cell.value==0){
                    cell.isLocked=true
                }
            }
        }
    }
    
    func printBoard() -> Void{
        var temp:[Int]=[]
        for row in self.board{
            temp=[]
            for cell in row{
                temp.append(cell.value)
            }
            print(temp)
        }
        print("")
    }
    
    func getBoardAsString()->String{
        var sBoard=""
        for row in board{
            for cell in row{
                sBoard=sBoard+"\(cell.value)"
            }
        }
        return sBoard
    }
    
    func getNotesAsString()->String{
        var temp=""
        for row in board{
            for cell in row{
                temp=temp+"0c"
                for note in cell.notes{
                    temp=temp+"\(note)"
                }
            }
        }
        return temp
    }
    
    func getIsLockedAsString()->String{
        var temp=""
        for row in board{
            for cell in row{
                if cell.isLocked{
                    temp=temp+"1"
                }
                else{
                    temp=temp+"0"
                }
            }
        }
        return temp
    }
    
    func getValuesInSquare(_ row:Int, _ col:Int)->[Int]{
        
        let squareRow=Int(row/3)
        let squareCol=Int(col/3)
        
        var values:[Int]=[]
        
        for i in squareRow*3...squareRow*3+2{
            for j in squareCol*3...squareCol*3+2{
                if !values.contains(self.board[i][j].value) && !(self.board[i][j].value==0){
                    values.append(self.board[i][j].value)
                }
                
            }
        }
        return values
    }
    
    func getValuesInRow(_ row:Int) -> [Int]{
        
        var values:[Int]=[]
        
        for cell in self.board[row]{
            if !values.contains(cell.value) && !(cell.value==0){
                values.append(cell.value)
            }
        }
        
        return values
    }
    
    func getValuesInCol(_ col:Int) -> [Int]{
        
        var values:[Int]=[]
        
        for i in 0...8{
            if !values.contains(self.board[i][col].value) && !(self.board[i][col].value==0){
                values.append(self.board[i][col].value)
            }
        }
        
        return values
    }
    
    func getAllValues(_ row:Int, _ col:Int) -> [Int]{
        return Array(Set(getValuesInRow(row)+getValuesInCol(col)+getValuesInSquare(row, col)))
    }
    
    func getAllPossibleValues(_ row:Int,_ col:Int)->[Int]{
        var pValues:[Int]=[]

        for i in 1...9{
            if !getAllValues(row, col).contains(i){
                pValues.append(i)
            }
        }
        if !(board[row][col].value==0)&&pValues.contains(board[row][col].value){
            //pValues.append(board[row][col].value)
        }
        return pValues.sorted()
    }
    
    func isFull()->Bool{
        for row in self.board{
            for cell in row{
                if !cell.hasValue{
                    return false
                }
            }
        }
        
        return true
    }
    
    func createSolvedBoard(){
        
        var coordinateGrid:[(Int,Int)]=[]
        for _ in 0...3{
            coordinateGrid.append((Int.random(in: 0...8),Int.random(in: 0...8)))
        }
        
        for spot in coordinateGrid{
            board[spot.0][spot.1].value=getAllPossibleValues(spot.0, spot.1)[Int.random(in:0...getAllPossibleValues(spot.0, spot.1).count-1)]
            board[spot.0][spot.1].isLocked=true
        }
        var count=0
        solveBoard(solveCap: 1, solveCount: &count)
        
        for row in board{
            for cell in row{
                cell.isLocked=true
            }
        }
    }
    
    func clearBoard(){
        for row in board{
            for cell in row{
                if !cell.isLocked{
                    cell.value=0
                }
            }
        }
    }
    
    func copyBoard()->Board{
        
        var newBoard:[[Cell]]=[]
        var temp:[Cell]=[]
        for row in board{
            temp=[]
            for cell in row{
                temp.append(Cell(cell.row, cell.column, cell.value, cell.isLocked))
            }
            newBoard.append(temp)
        }
        let copy=Board()
        copy.board=newBoard
        return copy
    }
    
    func solveBoard1()-> Bool{
        var solveCount=0
        for i in 0...80{
            let row=Int(i/9)
            let col=i%9
            
            if board[row][col].value==0 {
                
                let pVals=getAllPossibleValues(row, col)
                for val in pVals{
                    board[row][col].value=val
                    //print(pVals)
                    //printBoard()
                    if solveBoard1() {//&& (i != 80 || solveCount > 1){
                        return true
                    }
                    else{
                        if i==80{
                            solveCount+=1
                            print(solveCount)
                            print("solved")
                            //printBoard()
                        }
                        board[row][col].value=0
                        //printBoard()
                    }
                }
                return false
            }
        }
        return true
    }
    
    func solveBoard(solveCap:Int, solveCount: inout Int)-> Int{

        for i in 0...80{
            let row=Int((80-i)/9)
            let col=(80-i)%9
            
            if board[row][col].value==0 {
                
                let pVals=getAllPossibleValues(row, col)
                for val in pVals{
                    board[row][col].value=val
                    //print(pVals)
                    //printBoard()
                    solveCount=solveBoard(solveCap: solveCap, solveCount: &solveCount)
                    //print("solve count is \(solveCount) at location \(i)")
                    if solveCount==solveCap && (i != 80 || solveCount==solveCap) {
                        return solveCap
                    }
                    else{
                        if i==80{
                            solveCount+=1
                            printBoard()
                            //print("solved \(solveCount) times")
                        }
                        board[row][col].value=0
                    }
                }
                return solveCount
            }
        }
        return solveCount
    }
    
    func checkUnique() -> Bool{

        var count=0
        if solveBoard(solveCap: 2, solveCount: &count)==2{
            clearBoard()
            return false
        }
        
        clearBoard()
        return true
    }
    
    func updateNotes(row:Int, col:Int, value:Int){
        
        let squareRow=Int(row/3)
        let squareCol=Int(col/3)
        
        
        for i in squareRow*3...squareRow*3+2{
            for j in squareCol*3...squareCol*3+2{
                if board[i][j].notes.contains(value){
                    board[i][j].notes.remove(at: board[i][j].notes.firstIndex(of: value)! )
                }
            }
        }
        
        for cell in self.board[row]{
            if cell.notes.contains(value){
                cell.notes.remove(at: cell.notes.firstIndex(of: value)! )
            }
        }
        
        for i in 0...8{
            if board[i][col].notes.contains(value){
                board[i][col].notes.remove(at: board[i][col].notes.firstIndex(of: value)! )
            }
        }
        
    }
    
}
