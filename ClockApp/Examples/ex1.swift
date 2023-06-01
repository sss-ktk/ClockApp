//
//  ex1.swift
//  ClockApp
//
//  Created by Sota Kataoka on 5/31/23.
//

import SwiftUI

struct ex1: View {
    // Define a timezone option struct
    struct TimezoneOption: Identifiable, Hashable {
        let id = UUID()
        let identifier: String
        let displayName: String
    }
    
    // Array of timezone options
    @State private var timezoneOptions: [TimezoneOption] = []
    
    // Selected timezone option
    @State private var selectedTimezoneOption: TimezoneOption?
    
    var body: some View {
        VStack {
            Text("Selected Timezone: \(selectedTimezoneOption?.displayName ?? "")")
                .font(.headline)
            
            Picker("Select Timezone", selection: $selectedTimezoneOption) {
                ForEach(timezoneOptions) { option in
                    Text(option.displayName)
                }
            }
            .pickerStyle(DefaultPickerStyle()) // Choose the desired style
        }
        .padding()
        .onAppear {
            loadTimezoneOptions()
        }
    }
    
    // Load timezone options using NSTimeZone
    func loadTimezoneOptions() {
        let timeZones = NSTimeZone.knownTimeZoneNames
        
        timezoneOptions = timeZones.map { identifier in
            let timezone = TimeZone(identifier: identifier)!
            let displayName = timezone.identifier.components(separatedBy: "/").last?.replacingOccurrences(of: "_", with: " ") ?? ""
            
            return TimezoneOption(identifier: identifier, displayName: displayName)
        }
    }
}

struct ex1_Previews: PreviewProvider {
    static var previews: some View {
        ex1()
    }
}

