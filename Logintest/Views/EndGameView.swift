//
//  EndGameView.swift
//  Logintest
//
//  Created by Alexander Bullard (student LM) on 5/27/22.
//

import Foundation
import SwiftUI

func isHighscore(highscores: FetchedResults<Highscore>, game: Game)->Bool{
    var isContained=false
    for score in highscores{
        if game.difficulty==score.difficulty{
            isContained=true
            if game.time < score.time{
                return true
            }
        }
    }
    if !isContained{
        return true
    }
    return false
}


struct EndGameView: View{
    
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var savedSudokus: FetchedResults<Sudoku>
    @FetchRequest(sortDescriptors: [SortDescriptor(\.difficulty, order: .reverse)]) var highscores: FetchedResults<Highscore>
    @Binding var game:Game
    @Binding var gameStarted:Bool
    
    var body: some View{
        
        Color.black.opacity(0.8).ignoresSafeArea()
        
        ZStack{

            VStack{
                

                Spacer()
                HStack{
                    Spacer()
                    NeonLineView(color: Color("NeonOrangeShadow"), width: 30, rotation: 0.0, vertical: false)
                    NeonLineView(color: Color("NeonShadow"), width: 280, rotation: 0.0, vertical: false)
                    NeonLineView(color: Color("NeonOrangeShadow"), width: 30, rotation: 0.0, vertical: false)
                    Spacer()
                }
                Text("Congrats!!")
                
                    .padding(50)
                    .font(.system(size: 40, weight:.heavy))
                    .foregroundColor(Color("Neon"))
                    .shadow(color: Color("NeonShadow"), radius: 10, x: 0, y: 0)
                    .shadow(color: Color("NeonShadow"), radius: 10, x: 0, y: 0)
                    .shadow(color: Color("NeonShadow"), radius: 10, x: 0, y: 0)
                
                if isHighscore(highscores: highscores, game: game){
                    Text("New Highscore")
                        .font(.system(size: 20))
                        .foregroundColor(Color("Neon"))
                        .shadow(color: Color("NeonShadow"), radius: 10, x: 0, y: 0)
                        .shadow(color: Color("NeonShadow"), radius: 10, x: 0, y: 0)
                }
                HStack{
                    Spacer()
                    NeonLineView(color: Color("NeonOrangeShadow"), width: 30, rotation: 0.0, vertical: false)
                    NeonLineView(color: Color("NeonShadow"), width: 280, rotation: 0.0, vertical: false)
                    NeonLineView(color: Color("NeonOrangeShadow"), width: 30, rotation: 0.0, vertical: false)
                    Spacer()
                }
                Button(action:{
                    
                    gameStarted.toggle()
                    
                }){
                    
                    
                    Text("Back to Home")
                        .font(.system(size: 20))
                        .foregroundColor(Color("NeonOrange"))
                        .shadow(color: Color("NeonOrangeShadow"), radius: 10, x: 0, y: 0)
                        .shadow(color: Color("NeonOrangeShadow"), radius: 10, x: 0, y: 0)
                        .shadow(color: Color("NeonOrangeShadow"), radius: 10, x: 0, y: 0)
                }.padding(.top, 60)
                Spacer()
            }
        }
    }
}
