//
//  DigitalView.swift
//  ClockApp
//
//  Created by Sota Kataoka on 2/19/23.
//

import SwiftUI

struct DigitalView: View {
    @State var dateText = ""
    @State var nowDate = Date()
    private let dateFormatter = DateFormatter()
    
    init() {
        dateFormatter.dateFormat = "YYYY/MM/dd(E) \nHH:mm:ss"
        dateFormatter.locale = Locale(identifier: "ja_jp")
    }
    
    var body: some View {
        Text(dateText.isEmpty ? "\(dateFormatter.string(from: nowDate))" : dateText)
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                self.nowDate = Date()
                dateText = "\(dateFormatter.string(from: nowDate))"
            }
        }
    }
    
}
    

struct DigitalView_Previews: PreviewProvider {
    static var previews: some View {
        DigitalView()
    }
}
