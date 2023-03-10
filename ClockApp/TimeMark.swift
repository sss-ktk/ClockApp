//
//  TimeMark.swift
//  ClockApp
//
//  Created by Sota Kataoka on 3/8/23.
//

import SwiftUI

struct TimeMark: View {
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            
            ForEach(0..<360, id: \.self) { num in
                if (num % 30 == 0){
                    Rectangle()
                        .offset(y: -150)
                        .frame(maxWidth: 4, maxHeight: 10)
                        .foregroundColor(.white)
                        .rotationEffect(.degrees(Double(num)))
                        .opacity(0.4)
                }
                else if (num % 6 == 0) {
                    Rectangle()
                        .offset(y: -150)
                        .frame(maxWidth: 1, maxHeight: 5)
                        .foregroundColor(.white)
                        .rotationEffect(.degrees(Double(num)))
                        .opacity(0.2)
                }
                else if (num % 3 == 0) {
                    Rectangle()
                        .offset(y: -150)
                        .frame(maxWidth: 1, maxHeight: 3)
                        .foregroundColor(.white)
                        .rotationEffect(.degrees(Double(num)))
                        .opacity(0.2)
                }
            }
        }
    }
}

struct TimeMark_Previews: PreviewProvider {
    static var previews: some View {
        TimeMark()
    }
}
