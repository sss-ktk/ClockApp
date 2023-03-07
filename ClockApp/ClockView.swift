//
//  ClockView.swift
//  ClockApp
//
//  Created by Sota Kataoka on 2/19/23.
//

import SwiftUI
import UIKit

struct ClockView: View {
    @State private var currentTime = Date()
    
//    let r: CGFloat =  100
    
    var body: some View {
        
        let secondHandColor = Color(hex: "FF0000") // red
        let minuteHandColor = Color(hex: "00FF00") // green
        let hourHandColor = Color(hex: "0000FF") // blue


        ZStack{
            ZStack{
                Circle()
                    .frame(maxWidth: 10, maxHeight: 10)
                    .foregroundColor(.orange)
                    .offset(x: -100)
                Circle()
                    .stroke()
                    .frame(maxWidth: 20, maxHeight: 20)
                    .foregroundColor(.orange)
                    .offset(x: 110)
            }
            ZStack{
                ForEach(0..<360, id: \.self) { num in
                    if (num % 30 == 0){
                        Rectangle()
                            .offset(y: -150)
                            .frame(maxWidth: 4, maxHeight: 10)
                            .foregroundColor(.black)
                            .rotationEffect(.degrees(Double(num)))
                            .opacity(0.4)
                    }
                    else if (num % 6 == 0) {
                        Rectangle()
                            .offset(y: -150)
                            .frame(maxWidth: 1, maxHeight: 5)
                            .foregroundColor(.black)
                            .rotationEffect(.degrees(Double(num)))
                            .opacity(0.2)
                    }
                    else if (num % 3 == 0) {
                        Rectangle()
                            .offset(y: -150)
                            .frame(maxWidth: 1, maxHeight: 3)
                            .foregroundColor(.black)
                            .rotationEffect(.degrees(Double(num)))
                            .opacity(0.2)
                    }
                }
            }
            ZStack{
                Rectangle()
                    .fill(secondHandColor)
                    .frame(width: 2, height: 100)
                    .offset(y: -40)
                    .rotationEffect(Angle(degrees: Double(Calendar.current.component(.second, from: currentTime)) / 60 * 360))
                    .animation(.linear(duration: 1), value: currentTime)
                    .rotationEffect(.degrees(180), anchor: .center) // <-- added this line

                Rectangle()
                    .fill(minuteHandColor)
                    .frame(width: 4, height: 70)
                    .offset(y: -35)
                    .rotationEffect(Angle(degrees: Double(Calendar.current.component(.minute, from: currentTime)) / 60 * 360))

                Rectangle()
                    .fill(hourHandColor)
                    .frame(width: 4, height: 50)
                    .offset(y: -25)
                    .rotationEffect(Angle(degrees: Double(Calendar.current.component(.hour, from: currentTime)) / 12 * 360))
            }
            .padding()
            .aspectRatio(contentMode: .fit)
            }
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                    self.currentTime = Date()
                }
            }
            
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
