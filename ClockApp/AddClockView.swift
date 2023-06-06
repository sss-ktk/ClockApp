//
//  AddClockView.swift
//  ClockApp
//
//  Created by Sota Kataoka on 6/5/23.
//

import SwiftUI

struct AddClockView: View {
    @EnvironmentObject var clockConfigurationStore: ClockConfigurationStore
    @Binding var clockConfiguration: ClockConfiguration?
    var onAdd: (ClockConfiguration) -> Void

    @State private var selectedTimezone: TimeZone?
    @State private var selectedHandColor: Color = .blue
    @State private var selectedLabelColor: Color = .white
    
    var body: some View {
        VStack {
            Text("Add Clock")
                .font(.title)
                .padding()
            
            // Timezone Picker
            VStack {
                Text("Timezone")
                    .font(.headline)
                SearchBar(text: $searchText)
                
                ScrollView {
                    ForEach(filteredTimezones) { timezone in
                        Button(action: {
                            selectedTimezone = timezone.timezone
                        }) {
                            Text(timezone.identifier.replacingOccurrences(of: "_", with: " "))
                        }
                    }

                }
                .padding()
            }
            
            // Hand Color Picker
            VStack {
                Text("Hand Color")
                    .font(.headline)
                ColorPicker("Select Hand Color", selection: $selectedHandColor)
                    .padding()
            }
            
            // Label Color Picker
            VStack {
                Text("Label Color")
                    .font(.headline)
                ColorPicker("Select Label Color", selection: $selectedLabelColor)
                    .padding()
            }
            
            Button(action: {
                if let timezone = selectedTimezone {
                            let newClockConfiguration = ClockConfiguration(handColor: selectedHandColor, labelColor: selectedLabelColor, timeZone: timezone)
                            onAdd(newClockConfiguration)
                        }          }) {
                Text("Add Clock")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .disabled(selectedTimezone == nil)
            
            Spacer()
        }
        .padding()
    }
    
    private var filteredTimezones: [TimezoneWrapper] {
        guard !searchText.isEmpty else {
            return TimeZone.knownTimeZoneIdentifiers.compactMap { identifier in
                TimezoneWrapper(identifier: identifier)
            }
        }
        return TimeZone.knownTimeZoneIdentifiers
            .filter { timezoneIdentifier in
                let searchComponents = searchText.components(separatedBy: " ")
                let timezoneComponents = timezoneIdentifier.components(separatedBy: "/")
                return searchComponents.allSatisfy { searchComponent in
                    timezoneComponents.contains { timezoneComponent in
                        timezoneComponent.localizedCaseInsensitiveContains(searchComponent)
                    }
                }
            }
            .compactMap { identifier in
                TimezoneWrapper(identifier: identifier)
            }
    }

    
    @State private var searchText: String = ""
}

struct AddClockView_Previews: PreviewProvider {
    static var previews: some View {
        let clockConfigurationStore = ClockConfigurationStore()
                return AddClockView(clockConfiguration: .constant(nil), onAdd: { newClockConfiguration in
                    // Implement logic to add newClockConfiguration to clockConfigurationStore
                    clockConfigurationStore.addClockConfiguration(newClockConfiguration)
                })            .environmentObject(ClockConfigurationStore())
    }
}

struct TimezoneWrapper: Identifiable {
    let id = UUID()
    let identifier: String
    var timezone: TimeZone {
        TimeZone(identifier: identifier)!
    }
}

