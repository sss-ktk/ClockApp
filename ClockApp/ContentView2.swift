//
//  ContentView2.swift
//  ClockApp
//
//  Created by Sota Kataoka on 2/17/23.
//

import SwiftUI

struct ContentView2: View {
    
    //    var clockUpdateTimer: Timer!
    @State var dateText = ""
    @State var nowDate = Date()
    private let dateFormatter = DateFormatter()
    init() {
        dateFormatter.dateFormat = "YYYY/MM/dd(E) \nHH:mm:ss"
        dateFormatter.locale = Locale(identifier: "ja_jp")
    }
    func getToday(format:String = "yyyy/MM/dd HH:mm:ss") -> String{
        //        self.clockUpdateTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: @Sendable(Timer) -> Void)
        //        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
        //
        //        }
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: now as Date)
    }
    //    let everyMinuteTimer = Timer.scheduledTimer(timeInterval: 60, target: .self,
    //    selector: #selector(printTime), userInfo: nil, repeats: true)
    
    func getTodayJP(format:String = "yyyy/MM/dd HH:mm:ss") -> String{
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        return formatter.string(from: now as Date)
    }
    
        var body: some View {
            ZStack {
    //            Image(systemName: "globe")
    //                .imageScale(.large)
    //                .foregroundColor(.accentColor)
                HStack {
                    VStack {
                        Text("US")
    
//                        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
//                            Text(getToday(format: "MM"))
//                                .onAppear {
//                                    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
//                                            self.nowDate = Date()
//                                            dateText = "\(dateFormatter.string(from: nowDate))"
//                                        }
//                            Text(getToday(format: "dd"))
    //                        Text(getToday(format: "HH"))
    //                        Text(getToday(format: "mm"))
//                            Text(getToday(format: "ss"))
    //                        _=printTime()
                        }
    
                    }
                    VStack {
//                        Text("JP")
//                        Text(getTodayJP(format: "MM"))
//                        Text(getTodayJP(format: "dd"))
//                        Text(getTodayJP(format: "HH"))
//                        Text(getTodayJP(format: "mm"))
//                        Text(getTodayJP(format: "ss"))
                    }
                }.offset(y: 250)
    
    
            
//            .padding()
        }
    }
//    var body: some View {
//        Text(dateText.isEmpty ? "\(dateFormatter.string(from: nowDate))" : dateText)
//            .onAppear {
//                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
//                    self.nowDate = Date()
//                    dateText = "\(dateFormatter.string(from: nowDate))"
//                }
//            }
//    }
//}
struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}

