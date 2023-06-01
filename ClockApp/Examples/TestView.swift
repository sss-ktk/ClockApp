//
//  TestView.swift
//  ClockApp
//
//  Created by Sota Kataoka on 3/7/23.
//

import SwiftUI

struct TestView: View {
    private let lineWidth: CGFloat = 10
    private let circlePadding: CGFloat = 30
    
    private var hourDegree: Double {
        Double(Calendar.current.component(.hour, from: Date())) / 12 * 360
    }
    
    private var minuteDegree: Double {
        Double(Calendar.current.component(.minute, from: Date())) / 60 * 360
    }
    
    private var secondDegree: Double {
        Double(Calendar.current.component(.second, from: Date())) / 60 * 360
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray, lineWidth: lineWidth)
                .padding(circlePadding)
            
            ForEach(0..<60) { tick in
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 2, height: tick % 5 == 0 ? 15 : 7)
                    .offset(y: (UIScreen.main.bounds.width / 2 - lineWidth - circlePadding - 8) / 2)
                    .rotationEffect(.degrees(Double(tick) / 60 * 360))
            }
            
            // Hour Hand
            Rectangle()
                .fill(Color.white)
                .frame(width: 10, height: 90)
                .cornerRadius(10)
                .offset(y: -45)
                .rotationEffect(.degrees(hourDegree))
                .shadow(radius: 5)
            
            // Minute Hand
            Rectangle()
                .fill(Color.white)
                .frame(width: 5, height: 140)
                .cornerRadius(5)
                .offset(y: -70)
                .rotationEffect(.degrees(minuteDegree))
                .shadow(radius: 5)
            
            // Second Hand
            Rectangle()
                .fill(Color.red)
                .frame(width: 2, height: 160)
                .cornerRadius(2)
                .offset(y: -80)
                .rotationEffect(.degrees(secondDegree))
                .shadow(radius: 5)
            
            // Center Circle
            Circle()
                .fill(Color.white)
                .frame(width: 20, height: 20)
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(Color.black)
    }
}
