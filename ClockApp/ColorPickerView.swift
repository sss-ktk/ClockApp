//
//  ColorPickerView.swift
//  ClockApp
//
//  Created by Sota Kataoka on 6/1/23.
//

import SwiftUI

struct ColorPickerView: View {
    @Binding var selectedColor: Color
    var body: some View {
        ColorPicker("Select Color", selection: $selectedColor)
    }
}
