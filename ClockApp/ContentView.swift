////
////  ContentView.swift
////  ClockApp
////
////  Created by Sota Kataoka on 2/14/23.
////

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
        
        var cityName: String {
                    let calendar = Calendar.current
//                    let components = calendar.dateComponents(in: timeZone, from: Date())
                    let cityName = timeZone.identifier.components(separatedBy: "/").last ?? ""
                    return cityName.replacingOccurrences(of: "_", with: " ")
                }
    }
    
    @State private var clockConfigurations: [ClockConfiguration] = [
        ClockConfiguration(timeZone: TimeZone(identifier: "Asia/Tokyo")!, color: Color.blue),
        ClockConfiguration(timeZone: TimeZone(identifier: "America/New_York")!, color: Color.green)
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
            
            
            //            VStack {
            //                ForEach(clockConfigurations.indices, id: \.self) { configuration in
            //                    AnalogView(clockConfiguration: clockConfigurations[configuration])
            //                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / CGFloat(clockConfigurations.count))
            //                        .background(Color.black)
            //                }
            //            }
            
            
//            VStack {
                GeometryReader { geometry in
                    
                    let w = geometry.size.width
                    let h = geometry.size.height
                    
                    ZStack {
                        ForEach(clockConfigurations.indices, id: \.self) { index in
                                ZStack{
                                    Text(clockConfigurations[0].cityName)
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .position(x: w/2, y: 200)
                                    TimeMark()
                                    Demo(timeZone: clockConfigurations[0].timeZone, color: clockConfigurations[0].color)
                                }
                                .position(x: w/2, y: h/8)
                                .scaleEffect(0.8)
                                .background(Color.black)
                            

                            ZStack{
                                Text(clockConfigurations[1].cityName)
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .position(x: w/2, y: 200)
                                TimeMark()
                                Demo(timeZone: clockConfigurations[1].timeZone, color: clockConfigurations[1].color)
                            }
                            .position(x: w/2, y: 7*h/8 - 100)
                            .scaleEffect(0.8)

                            
                        }
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
                    .tag(Tab.Digital)

                
        }
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

