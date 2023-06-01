//
//  ColorPickerButton.swift
//  ClockApp
//
//  Created by Sota Kataoka on 6/1/23.
//

import SwiftUI

struct ColorPickerButton: View {
    @Binding var selectedColor: Color

    var body: some View {
        Button(action: {
            self.showingColorPicker = true
        }) {
            Circle()
                .fill(selectedColor)
                .frame(width: 24, height: 24)
        }
        .sheet(isPresented: $showingColorPicker) {
            ColorPicker("Select a Color", selection: $selectedColor)
                .padding()
        }
    }

    @State private var showingColorPicker = false
}
