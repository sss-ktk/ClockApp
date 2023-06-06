
//  TimeZonePickerView.swift
//  ClockApp
//
//  Created by Sota Kataoka on 6/1/23.
//

import SwiftUI

struct TimeZonePickerView: View {
    @Binding var selectedTimeZone: TimeZone
    @State private var searchText = ""
    let timeZones = TimeZone.knownTimeZoneIdentifiers.map { TimeZone(identifier: $0)! }

    var body: some View {
        VStack {
            SearchBar(text: $searchText)
            List {
                ForEach(timeZones.filter { timeZone in
                    searchText.isEmpty || timeZone.identifier.localizedCaseInsensitiveContains(searchText)
                }, id: \.identifier) { timeZone in
                    Button(action: {
                        selectedTimeZone = timeZone
                    }) {
                        Text(timeZone.identifier)
                    }
                }
            }
        }
    }
}

struct SearchBar: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }

    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
}

