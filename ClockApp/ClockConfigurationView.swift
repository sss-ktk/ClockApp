//
//  ClockConfigurationView.swift
//  ClockApp
//
//  Created by Sota Kataoka on 6/1/23.
//

import SwiftUI

struct ClockConfigurationView: View {
    @Binding var clockConfiguration: ClockConfiguration

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(clockConfiguration.cityName)
                    .font(.headline)
                Text("TimeZone: \(clockConfiguration.timeZone.identifier)")
                Text("Hand Color: \(clockConfiguration.color.description)")
                Text("Label Color: \(clockConfiguration.labelColor.description)")
            }
            Spacer()
            Button(action: {
                // TODO: Show TimeZonePickerView
            }) {
                Text("Change TimeZone")
            }
            Button(action: {
                // TODO: Show ColorPickerView for hand color
            }) {
                Text("Change Hand Color")
            }
            Button(action: {
                // TODO: Show ColorPickerView for label color
            }) {
                Text("Change Label Color")
            }
        }
    }
}

