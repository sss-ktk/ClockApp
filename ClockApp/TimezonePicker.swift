////
////  TimezonePicker.swift
////  ClockApp
////
////  Created by Sota Kataoka on 6/1/23.
////
//
//import SwiftUI
//
//struct TimezonePicker: View {
//    @Binding var selectedTimezone: TimeZone
//
//    var body: some View {
//        VStack {
//            TextField("Search...", text: $searchText)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding(.horizontal)
//
////            List(timezones) { timezone in
////                Text(timezone.identifier)
////                    .onTapGesture {
////                        self.selectedTimezone = timezone
////                    }
////            }
//        }
//        .onAppear {
//            self.timezones = TimeZone.knownTimeZoneIdentifiers.compactMap { TimeZone(identifier: $0) }
//        }
//    }
//
//    @State private var searchText = ""
//    @State private var timezones: [TimeZone] = []
//
//    private func filterTimezones() {
//        if searchText.isEmpty {
//            self.timezones = TimeZone.knownTimeZoneIdentifiers.compactMap { TimeZone(identifier: $0) }
//        } else {
//            self.timezones = TimeZone.knownTimeZoneIdentifiers.compactMap { TimeZone(identifier: $0) }
//                .filter { $0.identifier.lowercased().contains(searchText.lowercased()) }
//        }
//    }
//}
