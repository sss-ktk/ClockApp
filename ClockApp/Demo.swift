//
//  Demo.swift
//  ClockApp
//
//  Created by Sota Kataoka on 3/23/23.
//

import SwiftUI
import UIKit

struct Demo: View {
    @State private var currentDate = Date()
    let timeZone: TimeZone
    let color: Color

    private let timer = Timer.publish(every: 0.01, on: .current, in: .default).autoconnect()
    
    var body: some View {
        GeometryReader { geometry in
            
            let hourHandLength: CGFloat = 70
            
            let radius : CGFloat = 20

            ZStack{
               
                Circle()
                    .fill(.blue)
                    .opacity(0.5)
                    .frame(width: radius)
                
//                _1_HandDesign(color: color)
//                    .rotationEffect(minuteHandRotation())
//
//                _1_MinDesign(color: color )
//                    .rotationEffect(hourHandRotation())
//
//                _1_SecDesign(color: color)
//                    .offset(y: -(hourHandLength/2) + 45)
//                    .rotationEffect(secondHandRotation())
//                _2_HandDesign(clockConfiguration: configColor)
                _2_HandDesign(color: color)
                    .rotationEffect(minuteHandRotation())
                
                _2_MinDesign(color: color)
                    .rotationEffect(hourHandRotation())
                
                _2_SecDesign(color: color)
                    .offset(y: -(hourHandLength/2) + 45)
                    .rotationEffect(secondHandRotation())
            }
            .onReceive(timer) { input in
                withAnimation(.linear(duration: 0.01)) {
                    var calendar = Calendar.current
                    calendar.timeZone = timeZone
                    currentDate = input
                }
            }
            .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)

        }
    }
    
    private func secondHandRotation() -> Angle {
        var calendar = Calendar.current
        calendar.timeZone = timeZone
        let second = calendar.component(.second, from: currentDate)
        let millisecond = calendar.component(.nanosecond, from: currentDate) / 1_000_000
        return Angle.degrees(Double(second) * 6 + Double(millisecond) * 0.006)
    }
    
    private func minuteHandRotation() -> Angle {
        var calendar = Calendar.current
        calendar.timeZone = timeZone
        let minute = calendar.component(.minute, from: currentDate)
        let second = calendar.component(.second, from: currentDate)
        return Angle.degrees(Double(minute) * 6 + Double(second) * 0.1)
    }
    
    private func hourHandRotation() -> Angle {
        var calendar = Calendar.current
        calendar.timeZone = timeZone
        let hour = calendar.component(.hour, from: currentDate)
        let minute = calendar.component(.minute, from: currentDate)
        return Angle.degrees(Double(hour) * 30 + Double(minute) * 0.5)
    }
}


struct Demo_Previews: PreviewProvider {
    static var previews: some View {
//    Demo(timeZone: TimeZone(identifier: "America/Los_Angeles")!)
        Demo(timeZone: TimeZone(identifier: "America/Los_Angeles")!, color: .red)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(Color.gray)
    }
}
