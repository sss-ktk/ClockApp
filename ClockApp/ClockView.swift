//
//  ClockView.swift
//  ClockApp
//
//  Created by Sota Kataoka on 2/19/23.
//

import SwiftUI
import UIKit

struct ClockView: View {
    @State private var currentDate = Date()
    @State private var timeZone = TimeZone.current

    private let timer = Timer.publish(every: 0.01, on: .current, in: .default).autoconnect()
    
    var body: some View {
        
        let secondHandColor = Color(hex: "FF0000") // red
        let minuteHandColor = Color(hex: "00FF00") // green
        let hourHandColor = Color(hex: "FFFFFF")
        
        let clockHandWidth: CGFloat = 8
        let clockHandBorderWidth: CGFloat = 2
        let clockHandBorderColor = Color(hex: "000000")


        ZStack{
//            ZStack{
//                Circle()
//                    .frame(maxWidth: 10, maxHeight: 10)
//                    .foregroundColor(.orange)
//                    .offset(x: -100)
//                Circle()
//                    .stroke()
//                    .frame(maxWidth: 20, maxHeight: 20)
//                    .foregroundColor(.orange)
//                    .offset(x: 110)
//            }
            
//            ZStack{
//                ForEach(0..<360, id: \.self) { num in
//                    if (num % 30 == 0){
//                        Rectangle()
//                            .offset(y: -150)
//                            .frame(maxWidth: 4, maxHeight: 10)
//                            .foregroundColor(.black)
//                            .rotationEffect(.degrees(Double(num)))
//                            .opacity(0.4)
//                    }
//                    else if (num % 6 == 0) {
//                        Rectangle()
//                            .offset(y: -150)
//                            .frame(maxWidth: 1, maxHeight: 5)
//                            .foregroundColor(.black)
//                            .rotationEffect(.degrees(Double(num)))
//                            .opacity(0.2)
//                    }
//                    else if (num % 3 == 0) {
//                        Rectangle()
//                            .offset(y: -150)
//                            .frame(maxWidth: 1, maxHeight: 3)
//                            .foregroundColor(.black)
//                            .rotationEffect(.degrees(Double(num)))
//                            .opacity(0.2)
//                    }
//                }
//            }
            ZStack{
                Circle()
                    .fill(.blue)
                    .opacity(0.5)
                    .frame(width: 20, height: 20, alignment: .center)
                
                Rectangle()
                    .fill(secondHandColor)
                    .frame(width: 2, height: 100)
                    .offset(y: -55)
                    .rotationEffect(secondHandRotation())

                Rectangle()
                    .fill(minuteHandColor)
                    .frame(width: 4, height: 70)
                    .offset(y: -40)
                    .rotationEffect(minuteHandRotation())
                
                Rectangle()
                    .fill(hourHandColor)
                    .frame(width: clockHandWidth, height: 70)
                    .border(clockHandBorderColor, width: clockHandBorderWidth)
                    .offset(y: -40)
                    .rotationEffect(hourHandRotation())
            }
            .padding()
            .aspectRatio(contentMode: .fit)
            }
            .onReceive(timer) { input in
                withAnimation(.linear(duration: 0.01)) {
                    currentDate = input
                }
            }
            
    }
    private func secondHandRotation() -> Angle {
        let calendar = Calendar.current
        let second = calendar.component(.second, from: currentDate)
        let millisecond = calendar.component(.nanosecond, from: currentDate) / 1_000_000
        return Angle.degrees(Double(second) * 6 + Double(millisecond) * 0.006)
    }
    
    private func minuteHandRotation() -> Angle {
        let calendar = Calendar.current
        let minute = calendar.component(.minute, from: currentDate)
        let second = calendar.component(.second, from: currentDate)
        return Angle.degrees(Double(minute) * 6 + Double(second) * 0.1)
    }
    
    private func hourHandRotation() -> Angle {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: currentDate)
        let minute = calendar.component(.minute, from: currentDate)
        return Angle.degrees(Double(hour) * 30 + Double(minute) * 0.5)
    }
}


struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        
        if scanner.scanHexInt64(&rgbValue) {
            let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
            let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
            let b = Double(rgbValue & 0x0000FF) / 255.0
            self.init(red: r, green: g, blue: b)
        } else {
            self.init(red: 0, green: 0, blue: 0)
        }
    }
}
