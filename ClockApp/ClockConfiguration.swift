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

//class ClockConfigurations: ObservableObject {
//    @Published var configurations: [ClockConfiguration] = []
//
//    func addDefaultConfiguration() {
//        let defaultConfiguration = ClockConfiguration.defaultConfiguration
//        configurations.append(defaultConfiguration)
//    }
//
//    func updateConfiguration(_ configuration: ClockConfiguration) {
//        if let index = configurations.firstIndex(where: { $0.id == configuration.id }) {
//            configurations[index] = configuration
//        }
//    }
//
//    func deleteConfiguration(_ configuration: ClockConfiguration) {
//        configurations.removeAll(where: { $0.id == configuration.id })
//    }
//}
//
//extension ClockConfiguration: Equatable {
//    static func == (lhs: ClockConfiguration, rhs: ClockConfiguration) -> Bool {
//        return lhs.id == rhs.id
//    }
//}

