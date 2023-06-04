//
//  AnalogView.swift
//  ClockApp
//
//  Created by Sota Kataoka on 4/5/23.
//

import SwiftUI

struct AnalogView: View {
    var clockConfigurations = [ClockConfiguration]()
//    var clockConfigurations = ContentView.clockConfigurations
    var body: some View {
        GeometryReader { geometry in
            let clockCount = clockConfigurations.count
            
            switch clockCount {
            case 0:
                EmptyView()
            case 1:
                let configuration = clockConfigurations[0]
//                AnalogClock(configuration.handColor, configuration.labelColor, configuration.timeZone)
                AnalogClock(clockConfiguration: configuration)
                
            case 2:
                let configuration1 = clockConfigurations[0]
                let configuration2 = clockConfigurations[1]
                VStack(spacing: 0) {
                    AnalogClock(clockConfiguration: configuration1)
                    Divider()
                    AnalogClock(clockConfiguration: configuration2)
                }
            case 3:
                let configuration1 = clockConfigurations[0]
                let configuration2 = clockConfigurations[1]
                let configuration3 = clockConfigurations[2]
                VStack(spacing: 0) {
                    VStack(spacing: 0) {
                        AnalogClock(clockConfiguration: configuration1)
                        Divider()
                        HStack(spacing: 0) {
                            AnalogClock(clockConfiguration: configuration2)
                            Divider()
                            AnalogClock(clockConfiguration: configuration3)
                        }
                    }
                }
            case 4:
                                let configuration1 = clockConfigurations[0]
                                let configuration2 = clockConfigurations[1]
                                let configuration3 = clockConfigurations[2]
                                let configuration4 = clockConfigurations[3]
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        AnalogClock(clockConfiguration: configuration1)
                        Divider()
                        AnalogClock(clockConfiguration: configuration2)
                    }
                    Divider()
                    HStack(spacing: 0) {
                        AnalogClock(clockConfiguration: configuration3)
                        Divider()
                        AnalogClock(clockConfiguration: configuration4)
                    }
                }
            default:
                EmptyView()
            }
        }
    }
}

struct AnalogView_Previews: PreviewProvider {
    static var previews: some View {
        let clockconfig = [ClockConfiguration]()
//        AnalogView(ClockConfiguration(handColor: .white, labelColor: .white, timeZone: TimeZone(identifier: "Asia/Tokyo")!))
        AnalogView(clockConfigurations: clockconfig)
//            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(Color.black)
    }
}
