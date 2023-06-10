//
//  TimeMark.swift
//  ClockApp
//
//  Created by Sota Kataoka on 3/8/23.
//

import SwiftUI

struct TimeMark: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack{
    //            Color.black.edgesIgnoringSafeArea(.all)
                
//                ForEach(0..<360, id: \.self) { num in
//                    if (num % 30 == 0){
//                        Rectangle()
////                            .offset(y: -150)
//                            .position(y: -150)
//                            .frame(maxWidth: 4, maxHeight: 15)
//                            .foregroundColor(.white)
//                            .rotationEffect(.degrees(Double(num)))
////                            .opacity(0.4)
//                    }
//                    else if (num % 6 == 0) {
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
//                }
                ForEach(0..<60) { tick in
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 3, height: tick % 5 == 0 ? 15 : 7)
                        .offset(y: 300 / 2)
                        .rotationEffect(.degrees(Double(tick) / 60 * 360))
                        .opacity(tick % 5 == 0 ? 0.9 : 0.5)
                }
            }
//            .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
        }
    }
}

struct TimeMark_Previews: PreviewProvider {
    static var previews: some View {
        TimeMark()
//            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(Color.black)
    }
}
