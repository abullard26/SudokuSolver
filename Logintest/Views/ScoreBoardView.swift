//
//  ScoreBoardView.swift
//  Logintest
//
//  Created by Alexander Bullard (student LM) on 5/28/22.
//

import Foundation
import SwiftUI

struct ScoreBoardView: View{
    
    func timeFormat(time:Int)->String{
        let minutes=Int(time/60)
        
        return "\(minutes) min \(time-minutes*60) sec"
    }
    
    var difficultyList=["Very Easy", "Easy", "Medium", "Hard", "Very Hard"]
    @FetchRequest(sortDescriptors: [SortDescriptor(\.difficulty, order: .reverse)]) var highscores: FetchedResults<Highscore>
    
    var body: some View{
        
        Text("Highscores")
            .font(.system(size: 40))
            .bold()
            .foregroundColor(Color("Neon"))
            .shadow(color: Color("NeonShadow"), radius: 10, x: 0, y: 0)
            .shadow(color: Color("NeonShadow"), radius: 10, x: 0, y: 0)
            .shadow(color: Color("NeonShadow"), radius: 10, x: 0, y: 0)
            .shadow(color: Color("NeonShadow"), radius: 10, x: 0, y: 0)
            .padding(.top, 80)
        List(highscores){ score in
            
            Text("\(difficultyList[Int(score.difficulty)]): \(timeFormat(time: Int(score.time)))").bold()
            
        }.frame(width: 300, height: 150, alignment: .top)
            .border(Color("Neon"), width: 10)
            .shadow(color: Color("NeonShadow"), radius: 10, x: 0, y: 0)
            .shadow(color: Color("NeonShadow"), radius: 10, x: 0, y: 0)
            .shadow(color: Color("NeonShadow"), radius: 10, x: 0, y: 0)
            .cornerRadius(15)
            .background(Rectangle()
                            .frame(width: 300, height: 150, alignment: .center)
                            .cornerRadius(15)
                            .foregroundColor(Color("Neon"))
                            .shadow(color: Color("NeonShadow"), radius: 10, x: 0, y: 0)
                            .shadow(color: Color("NeonShadow"), radius: 10, x: 0, y: 0)
                            .shadow(color: Color("NeonShadow"), radius: 10, x: 0, y: 0))
        
    }
    
}
