//
//  ContentView.swift
//  ClockApp
//
//  Created by Sota Kataoka on 2/14/23.
//

import SwiftUI

struct ContentView: View {
    
    func getToday(format:String = "yyyy/MM/dd HH:mm:ss") -> String{
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: now as Date)
    }
    
    func getTodayJP(format:String = "yyyy/MM/dd HH:mm:ss") -> String{
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        return formatter.string(from: now as Date)
    }
    
    var body: some View {
        ZStack {
            ZStack{
                Circle()
                    .stroke(style: .init(lineWidth: 3, lineCap: .round, lineJoin: .round, dash: [0.5, 16], dashPhase: 1))
                    .frame(maxWidth: 300, maxHeight: 300)
                    .foregroundColor(.black)
                    .opacity(1)
            }
            ZStack{
                Circle()
                    .frame(maxWidth: 10, maxHeight: 10)
                    .foregroundColor(.orange)
                    .offset(x: -100)
                Circle()
                    .stroke()
                    .frame(maxWidth: 20, maxHeight: 20)
                    .foregroundColor(.orange)
                    .offset(x: 110)
            }
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
            HStack {
                VStack {
                    Text("US")
                    Text(getToday(format: "MM"))
                    Text(getToday(format: "dd"))
                    Text(getToday(format: "HH"))
                    Text(getToday(format: "mm"))
                    Text(getToday(format: "ss"))
                }.padding()
                VStack {
                    Text("JP")
                    Text(getTodayJP(format: "MM"))
                    Text(getTodayJP(format: "dd"))
                    Text(getTodayJP(format: "HH"))
                    Text(getTodayJP(format: "mm"))
                }
            }.offset(y: 250)
            
         
        }
//        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
