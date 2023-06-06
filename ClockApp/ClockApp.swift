//
//  ClockAppApp.swift
//  ClockApp
//
//  Created by Sota Kataoka on 2/14/23.
//

import SwiftUI

@main
struct ClockApp: App {
    let clockConfigurationStore = ClockConfigurationStore()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(clockConfigurationStore)
        }
    }
}
