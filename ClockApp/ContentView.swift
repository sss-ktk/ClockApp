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

    
//    @State private var clockConfigurations: [ClockConfiguration] = [
//        ClockConfiguration(timeZone: TimeZone(identifier: "Asia/Tokyo")!, color: Color.blue),
//        ClockConfiguration(timeZone: TimeZone(identifier: "America/New_York")!, color: Color.green)
//    ]
    @EnvironmentObject var clockConfiguration: ClockConfiguration
//    @EnvironmentObject var clockConfigurations: [ClockConfiguration] = [
//    @State private var clockConfigurations: [ClockConfiguration] = [
    var clockConfigurations: [ClockConfiguration] = [

//        ClockConfiguration(timeZone: TimeZone(identifier: "Asia/Tokyo")!, color: Color.blue),
//        ClockConfiguration(timeZone: TimeZone(identifier: "America/New_York")!, color: Color.green)
        ClockConfiguration(handColor: .white, labelColor: .white, timeZone: TimeZone(identifier: "Asia/Tokyo")!),
        ClockConfiguration(handColor: .blue, labelColor: .blue, timeZone: TimeZone(identifier: "America/New_York")!)
    ]
    

    var body: some View {
        TabView(selection: $selection) {
            GeometryReader { geometry in

                    let w = geometry.size.width
                    let h = geometry.size.height

                    ZStack {
                        ForEach(clockConfigurations.indices, id: \.self) { index in
                            ZStack{
                                AnalogClock(clockConfiguration: clockConfigurations[0])
                            }
                            .position(x: w/2, y: h/8)
                            .scaleEffect(0.8)
                            .background(Color.black)
                            
                            ZStack{
                                AnalogClock(clockConfiguration: clockConfigurations[1])
                            }
                            .position(x: w/2, y: 7*h/8 - 100)
                            .scaleEffect(0.8)

                        }
                    }
                }
//                AnalogView()
//                .background(.black)
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

