//
//  ClockView.swift
//  ClockApp
//
//  Created by Sota Kataoka on 2/19/23.
//

import SwiftUI

struct ClockView: View {
    var body: some View {
        
        ZStack{
            ZStack{
                Circle()
                    .stroke(style: .init(lineWidth: 3, lineCap: .round, lineJoin: .round, dash: [0.5, 16], dashPhase: 1))
                    .frame(maxWidth: 300, maxHeight: 300)
                    .foregroundColor(.black)
                    .opacity(1)
            }
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
        }
        
    }
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
    }
}
