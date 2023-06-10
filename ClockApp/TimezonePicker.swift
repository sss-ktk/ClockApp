//
//  TimeMark.swift
//  ClockApp
//
//  Created by Sota Kataoka on 3/8/23.
//

import SwiftUI

struct TimezonePicker: View {
    var body: some View {
        
        let lineWidth: CGFloat = 10
        let circlePadding: CGFloat = 0
        
        GeometryReader { geometry in
            ZStack{
                ForEach(0..<60) { tick in
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 2, height: tick % 5 == 0 ? 15 : 7)
                        .offset(y: (UIScreen.main.bounds.width / 2 - lineWidth - circlePadding - 8) / 2)
                        .rotationEffect(.degrees(Double(tick) / 60 * 360))
                }
                ForEach(0..<180, id: \.self) { num in
//                    if (num % 30 == 0){
//                        Rectangle()
////                            .offset(y: -150)
//                            .position(x:4, y: -150)
//                            .frame(maxWidth: 4, maxHeight: 15)
//                            .foregroundColor(.white)
//                            .rotationEffect(.degrees(Double(num)))
////                            .opacity(0.4)
//                    }
//                    if (num % 6 == 0) {
//                        Rectangle()
////                            .offset(y: -150)
//                            .position(y: -150)
//                            .frame(maxWidth: 1, maxHeight: 8)
//                            .foregroundColor(.white)
//                            .rotationEffect(.degrees(Double(num)))
//                            .opacity(0.5)
//                    }
//                    else if (num % 3 == 0) {
//                        Rectangle()
////                            .offset(y: -150)
//                            .position(y: -150)
//                            .frame(maxWidth: 1, maxHeight: 5)
//                            .foregroundColor(.white)
//                            .rotationEffect(.degrees(Double(num)))
//                            .opacity(0.5)
//                    }
                }
                ForEach(180..<360, id: \.self) { num in
//                    if (num % 30 == 0){
//                        Rectangle()
//                            .position(y: -150)
//                            .frame(maxWidth: 4, maxHeight: 15)
//                            .foregroundColor(.white)
//                            .rotationEffect(.degrees(Double(num)))
////                            .opacity(0.4)
//                    }
//                    if (num % 6 == 0) {
//                        Rectangle()
////                            .offset(y: -150)
//                            .position(y: -150)
//                            .frame(maxWidth: 1, maxHeight: 8)
//                            .foregroundColor(.white)
//                            .rotationEffect(.degrees(Double(num)))
//                            .opacity(0.5)
//                    }
//                    else if (num % 3 == 0) {
//                        Rectangle()
////                            .offset(y: -150)
//                            .position(y: -150)
//                            .frame(maxWidth: 1, maxHeight: 5)
//                            .foregroundColor(.white)
//                            .rotationEffect(.degrees(Double(num)))
//                            .opacity(0.5)
//                    }
                }
                ForEach(0..<360, id: \.self) { num in
                    
                }
            }
            .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
        }
    }
}

struct TimezonePicker_Previews: PreviewProvider {
    static var previews: some View {
        TimezonePicker()
//            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(Color.black)
    }
}

