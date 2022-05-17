//
//  ContentView.swift
//  Logintest
//
//  Created by Alexander Bullard (student LM) on 5/17/22.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State var username:String=""
    @State var password:String=""
    @State var verified:Bool=false
    @State var pressed:Int=0
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var savedSudokus: FetchedResults<Sudoku>
    
    
    var body: some View {
        if verified{
            LoginView(verified: self.$verified)
        }
        else{
            ZStack{
                Color.black.edgesIgnoringSafeArea(.all)
                
                VStack{
                    HStack{
                        VStack{
                            Text("Sudoku")
                                .bold()
                                .font(.system(size: UIScreen.main.bounds.width*0.145))
                                .foregroundColor(Color("Neon"))
                                .blur(radius: 1)
                                .shadow(color: Color("NeonShadow"), radius: UIScreen.main.bounds.width*0.05, x: 0, y: 0)
                                .shadow(color: Color("NeonShadow"), radius: UIScreen.main.bounds.width*0.05, x: 0, y: 0)
                                .shadow(color: Color("NeonShadow"), radius: UIScreen.main.bounds.width*0.05, x: 0, y: 0)
                            Text("Solver")
                                .bold()
                                .font(.system(size: UIScreen.main.bounds.width*0.145))
                                .foregroundColor(Color("NeonOrange"))
                                .blur(radius: 1)
                                .shadow(color: Color("NeonOrangeShadow"), radius: UIScreen.main.bounds.width*0.05, x: 0, y: 0)
                                .shadow(color: Color("NeonOrangeShadow"), radius: UIScreen.main.bounds.width*0.05, x: 0, y: 0)
                                .shadow(color: Color("NeonOrangeShadow"), radius: UIScreen.main.bounds.width*0.05, x: 0, y: 0)
                        }
                        Image("miniSudoku")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width*0.29, height: UIScreen.main.bounds.width*0.29, alignment: .center)
                            .blur(radius: 1).shadow(color: Color("NeonShadow"), radius: UIScreen.main.bounds.width*0.05, x: 0, y: 0)
                            .shadow(color: Color("NeonShadow"), radius: UIScreen.main.bounds.width*0.05, x: 0, y: 0)
                            .shadow(color: Color("NeonShadow"), radius: UIScreen.main.bounds.width*0.05, x: 0, y: 0)
                    }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width*0.5, alignment: .top).padding(UIScreen.main.bounds.width*0.072).padding(.top, UIScreen.main.bounds.width*0.25)
                    Spacer()
                    
                    Button(action: {
                        self.verified=true
                    }) {
                            Text("Start Game").bold()
                                .font(.system(size: UIScreen.main.bounds.width*0.1)).foregroundColor(Color("NeonOrange"))
                                .blur(radius: 1)
                                .frame(width: UIScreen.main.bounds.width*0.66, height: UIScreen.main.bounds.width*0.33, alignment: .center)
                                .shadow(color: Color("NeonOrangeShadow"), radius: UIScreen.main.bounds.width*0.025, x: 0, y: 0)
                                .shadow(color: Color("NeonOrangeShadow"), radius: UIScreen.main.bounds.width*0.025, x: 0, y: 0)
                                .shadow(color: Color("NeonOrangeShadow"), radius: UIScreen.main.bounds.width*0.025, x: 0, y: 0)
                                .background(NeonSignView().frame(width: UIScreen.main.bounds.width*0.66, height: UIScreen.main.bounds.width*0.17, alignment: .center))
                                .padding(.bottom, UIScreen.main.bounds.width*0.25)


                    }.padding(.bottom, UIScreen.main.bounds.width*0.25)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
