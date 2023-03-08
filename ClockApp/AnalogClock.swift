//
//  AnalogClock.swift
//  ClockApp
//
//  Created by Sota Kataoka on 3/8/23.
//

import SwiftUI

struct AnalogClock: View {
    @State private var currentDate = Date()
    private let timer = Timer.publish(every: 0.01, on: .current, in: .default).autoconnect()
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .shadow(color: .gray, radius: 5, x: 0, y: 5)
            ForEach(0..<60) { tick in
                Rectangle()
                    .fill(Color.black)
                    .frame(width: tick % 5 == 0 ? 2 : 1, height: tick % 5 == 0 ? 15 : 7.5)
                    .offset(y: -120)
                    .rotationEffect(Angle.degrees(Double(tick) * 6))
            }
            Rectangle()
                .fill(Color.black)
                .frame(width: 2, height: 80)
                .offset(y: -40)
                .rotationEffect(secondHandRotation())
            Rectangle()
                .fill(Color.black)
                .frame(width: 4, height: 60)
                .offset(y: -30)
                .rotationEffect(minuteHandRotation())
            Rectangle()
                .fill(Color.black)
                .frame(width: 6, height: 40)
                .offset(y: -20)
                .rotationEffect(hourHandRotation())
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
        return Angle.degrees(Double(second) * 6)
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

struct AnalogClock_Previews: PreviewProvider {
    static var previews: some View {
        AnalogClock()
    }
}
