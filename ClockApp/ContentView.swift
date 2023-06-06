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
//        case Settings
    }

    @EnvironmentObject var clockConfiguration: ClockConfiguration
    @EnvironmentObject var clockConfigurationStore: ClockConfigurationStore

    
//    var clockConfigurations: [ClockConfiguration] = [
//        ClockConfiguration(handColor: .white, labelColor: .white, timeZone: TimeZone(identifier: "Asia/Tokyo")!),
//        ClockConfiguration(handColor: .blue, labelColor: .blue, timeZone: TimeZone(identifier: "America/New_York")!),
//        ClockConfiguration(handColor: .red, labelColor: .red, timeZone: TimeZone(identifier: "America/Los_Angeles")!),
////        ClockConfiguration(handColor: .blue, labelColor: .blue, timeZone: TimeZone(identifier: "Europe/London")!),
//    ]
    

    var body: some View {
        NavigationView {
            
            TabView(selection: $selection) {
                //                AnalogView(clockConfigurations: clockConfigurations)
                AnalogView()
                
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
            .navigationBarTitle("Clock App")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: Settings()) {
                        Image(systemName: "gearshape")
                    }
                }
            }
        }
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .environmentObject(ClockConfigurationStore())
        }
    }

