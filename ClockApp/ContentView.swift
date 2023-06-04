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
        ClockConfiguration(handColor: .blue, labelColor: .blue, timeZone: TimeZone(identifier: "America/New_York")!),
        ClockConfiguration(handColor: .blue, labelColor: .blue, timeZone: TimeZone(identifier: "America/New_York")!),
//        ClockConfiguration(handColor: .blue, labelColor: .blue, timeZone: TimeZone(identifier: "Europe/London")!),
    ]
    

    var body: some View {
        TabView(selection: $selection) {
                AnalogView(clockConfigurations: clockConfigurations)
                .background(.black)
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

