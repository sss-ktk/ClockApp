//
//  ClockView.swift
//  ClockApp
//
//  Created by Sota Kataoka on 2/19/23.
//

import SwiftUI

struct ClockView: View {
//    let hourDial: [CGFloat] = [0,30,60,90, 120, 150, 180, 210, 240,]
    @State private var rotateSeconds  = false
    let r: CGFloat =  100
    var body: some View {
        
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
                ForEach(0...360, id: \.self) { num in
                    if (num % 30 == 0){
                        Rectangle()
                            .offset(y: -150)
                            .frame(maxWidth: 4, maxHeight: 10)
                            .foregroundColor(.black)
                            .rotationEffect(.degrees(Double(num)))
                            .opacity(0.4)
                    }
                    else {
                        Rectangle()
                            .offset(y: -150)
                            .frame(maxWidth: 1, maxHeight: 1)
                            .foregroundColor(.black)
                            .rotationEffect(.degrees(Double(num)))
                            .opacity(0.2)
                    }
                }
            }
            ZStack{
//                Circle()
//                    .frame(width: 5, height: 5)
//                    .foregroundColor(.red)
//                    .offset(x:-57)
//                    .rotationEffect(.degrees(rotateSeconds ? 360 : 0))
//                    .animation(Animation.linear(duration: 36).repeatForever(autoreverses: false))
//                    .onAppear(){
//                        self.rotateSeconds.toggle()
//                    }
            }
            
        }
        
    }
}



struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
    }
}
