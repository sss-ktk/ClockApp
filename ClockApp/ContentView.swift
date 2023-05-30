////
////  ContentView.swift
////  ClockApp
////
////  Created by Sota Kataoka on 2/14/23.
////
//
//import SwiftUI
//
//struct ContentView: View {
//
//    func getToday(format:String = "yyyy/MM/dd HH:mm:ss") -> String{
//        let now = Date()
//        let formatter = DateFormatter()
//        formatter.dateFormat = format
//        return formatter.string(from: now as Date)
//    }
//
//    func getTodayJP(format:String = "yyyy/MM/dd HH:mm:ss") -> String{
//        let now = Date()
//        let formatter = DateFormatter()
//        formatter.dateFormat = format
//        formatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
//        return formatter.string(from: now as Date)
//    }
//
//    var body: some View {
//        ZStack {
//            ZStack{
//                Circle()
//                    .stroke(style: .init(lineWidth: 3, lineCap: .round, lineJoin: .round, dash: [0.5, 16], dashPhase: 1))
//                    .frame(maxWidth: 300, maxHeight: 300)
//                    .foregroundColor(.black)
//                    .opacity(1)
//            }
//            ZStack{
//                Circle()
//                    .frame(maxWidth: 10, maxHeight: 10)
//                    .foregroundColor(.orange)
//                    .offset(x: -100)
//                Circle()
//                    .stroke()
//                    .frame(maxWidth: 20, maxHeight: 20)
//                    .foregroundColor(.orange)
//                    .offset(x: 110)
//            }
////            Image(systemName: "globe")
////                .imageScale(.large)
////                .foregroundColor(.accentColor)
//            HStack {
//                VStack {
//                    Text("US")
//                    Text(getToday(format: "MM"))
//                    Text(getToday(format: "dd"))
//                    Text(getToday(format: "HH"))
//                    Text(getToday(format: "mm"))
//                    Text(getToday(format: "ss"))
//                }.padding()
//                VStack {
//                    Text("JP")
//                    Text(getTodayJP(format: "MM"))
//                    Text(getTodayJP(format: "dd"))
//                    Text(getTodayJP(format: "HH"))
//                    Text(getTodayJP(format: "mm"))
//                }
//            }.offset(y: 250)
//
//
//        }
////        .padding()
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .Analog
    
    enum Tab {
        case Analog
        case Digital
    }
    
    struct ClockConfiguration {
        var timeZone: TimeZone
        var color: Color
    }
    
    // Array of clock configurations, you can modify this array as per your needs
    @State private var clockConfigurations: [ClockConfiguration] = [
        ClockConfiguration(timeZone: TimeZone(identifier: "Asia/Tokyo")!, color: Color.red),
        ClockConfiguration(timeZone: TimeZone(identifier: "America/Los_Angeles")!, color: Color.green),
//        ClockConfiguration(timeZone: TimeZone(identifier: "Europe/London")!, color: Color.blue)
    ]
    
    var body: some View {
        TabView(selection: $selection) {
//            ForEach(clockConfigurations.indices, id: \.self) { index in
//                AnalogView(clockConfiguration: clockConfigurations[index])
//                    .tabItem{
//                        Label("Analog \(index + 1)",
//                        systemImage: "star")
//                    }
//                    .tag(index)
//                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//                    .background(Color.black)
//            }
            VStack {
                ForEach(clockConfigurations.indices, id: \.self) { configuration in
                    AnalogView(clockConfiguration: clockConfigurations[configuration])
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / CGFloat(clockConfigurations.count))
                        .background(Color.black)
                }
            }
            .tabItem {
                Label("Analog", systemImage: "star")
            }
            .tag(Tab.Analog)
            
            DigitalView()
                .tabItem{
                    Label("Digital",
                    systemImage: "star")
                }
                .tag(clockConfigurations.count)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
