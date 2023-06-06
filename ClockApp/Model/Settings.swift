//
//  Settings.swift
//  ClockApp
//
//  Created by Sota Kataoka on 5/31/23.
//
import SwiftUI

struct Settings: View {
    @EnvironmentObject var clockConfigurationStore: ClockConfigurationStore
    @State private var isAddingClock = false
    @State private var clockToAdd: ClockConfiguration?
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Clock Configurations")) {
                    ForEach(clockConfigurationStore.clockConfigurations.indices, id: \.self) { index in
                        NavigationLink(destination: AddClockView(
                            clockConfiguration: Binding(
                                get: { clockConfigurationStore.clockConfigurations[index] },
                                set: { clockConfigurationStore.clockConfigurations[index] = $0! }
                            ),
                            onAdd: { newClockConfiguration in
                                clockConfigurationStore.updateClockConfiguration(clockConfigurationStore.clockConfigurations[index], with: newClockConfiguration)
                            }
                        )) {
                            Text(clockConfigurationStore.clockConfigurations[index].cityName)
                        }
                    }
                    .onDelete(perform: deleteClockConfiguration)
                }
                
                Section {
                    Button(action: {
                        isAddingClock = true
                    }) {
                        Label("Add Clock", systemImage: "plus")
                    }
                }
            }
            .navigationTitle("Settings")
        }
        .sheet(isPresented: $isAddingClock) {
            AddClockView(clockConfiguration: $clockToAdd, onAdd: { newClockConfiguration in
                clockConfigurationStore.addClockConfiguration(newClockConfiguration)
                isAddingClock = false
            })
        }
    }
    
    private func deleteClockConfiguration(at indices: IndexSet) {
        indices.forEach { index in
            clockConfigurationStore.deleteClockConfiguration(at: index)
        }
    }
}



struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        let clockConfigurationStore = ClockConfigurationStore()
        clockConfigurationStore.clockConfigurations = [
            ClockConfiguration(handColor: .white, labelColor: .white, timeZone: TimeZone(identifier: "Asia/Tokyo")!),
            ClockConfiguration(handColor: .blue, labelColor: .blue, timeZone: TimeZone(identifier: "America/New_York")!)
        ]
        
        return Settings()
            .environmentObject(clockConfigurationStore)
    }
}
