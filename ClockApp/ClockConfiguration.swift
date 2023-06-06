//
//  ClockConfiguration.swift
//  ClockApp
//
//  Created by Sota Kataoka on 6/2/23.
//

import Combine
import SwiftUI


class ClockConfiguration: ObservableObject, Identifiable {
    @Published var handColor: Color
    @Published var labelColor: Color
    @Published var timeZone: TimeZone
    
    static let defaultConfiguration = ClockConfiguration(handColor: .blue, labelColor: .white, timeZone: TimeZone(identifier: "Asia/Tokyo")!)

//    let objectWillChange = ObservableObjectPublisher()
//
//    var id: UUID {
//        return self.objectWillChange as! UUID
//    }
//
//    var isAnalog: Bool {
//        willSet {
//            objectWillChange.send()
//        }
//    }
//
//    var isDigital: Bool {
//        willSet {
//            objectWillChange.send()
//        }
//    }
//
//    var handColor: Color {
//        willSet {
//            objectWillChange.send()
//        }
//    }
//
//    var labelColor: Color {
//        willSet {
//            objectWillChange.send()
//        }
//    }
//
//    var timeZone: TimeZone {
//        willSet {
//            objectWillChange.send()
//        }
//    }
   var cityName: String {
            let cityName = timeZone.identifier.components(separatedBy: "/").last ?? ""
            return cityName.replacingOccurrences(of: "_", with: " ")
        }
    
    init(id: UUID = UUID(), handColor: Color, labelColor: Color, timeZone: TimeZone) {
        self.handColor = handColor
        self.labelColor = labelColor
        self.timeZone = timeZone
    }
    
    // Other properties and methods
    
}
class ClockConfigurationStore: ObservableObject {
    @Published var clockConfigurations: [ClockConfiguration] = [
        ClockConfiguration(handColor: .white, labelColor: .white, timeZone: TimeZone(identifier: "Asia/Tokyo")!),
        ClockConfiguration(handColor: .blue, labelColor: .blue, timeZone: TimeZone(identifier: "America/New_York")!),
        ClockConfiguration(handColor: .red, labelColor: .red, timeZone: TimeZone(identifier: "America/Los_Angeles")!),
    ]
    let maxClocks = 4

//    func addClockConfiguration() {
//        guard clockConfigurations.count < maxClocks else {
//                    return
//        }
//        let defaultConfiguration = ClockConfiguration.defaultConfiguration
//        clockConfigurations.append(defaultConfiguration)
//    }
    func addClockConfiguration(_ configuration: ClockConfiguration) {
        guard clockConfigurations.count < maxClocks else {
                    return
        }
        clockConfigurations.append(configuration)
    }
    
    func deleteClockConfiguration(at index: Int) {
        guard index >= 0 && index < clockConfigurations.count else {
            return
        }
        clockConfigurations.remove(at: index)
    }
    func updateClockConfiguration(_ oldConfiguration: ClockConfiguration, with newConfiguration: ClockConfiguration) {
        guard let index = clockConfigurations.firstIndex(where: { $0.id == oldConfiguration.id }) else {
            return
        }
        clockConfigurations[index] = newConfiguration
    }
}

