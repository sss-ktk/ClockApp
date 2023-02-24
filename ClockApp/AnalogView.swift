//
//  AnalogView.swift
//  ClockApp
//
//  Created by Sota Kataoka on 2/23/23.
//

import SwiftUI

struct AnalogView: View {
    let numbers: [CGFloat] = [0,10,20,30,40,50,60,70,80,90,100,110,120,130,140,
                              150, 160, 170, 180]
    
    var body: some View {
        
        GeometryReader { geometry in
            let width = min(geometry.size.width, geometry.size.height)
            let height = geometry.size.height
            let middle = width * 0.5
            let adjustment = CGFloat(20)
            
            ForEach(numbers, id: \.self){ num in
                Path { path in
                    path.addLines([
                        CGPoint(x: middle-1, y: height/2 + adjustment),
                        CGPoint(x: middle-1, y: height/2 - adjustment),
                        CGPoint(x: middle+1, y: height/2 - adjustment),
                        CGPoint(x: middle+1, y: height/2 + adjustment)
                    ])
                }
                .fill(.red)
//                .rotationEffect(.degrees(num), anchor: .leading)
                .rotationEffect(.degrees(num))
                .offset(x:10, y: 80)
            }
        }
        
    }
}

struct AnalogView_Previews: PreviewProvider {
    static var previews: some View {
        AnalogView()
    }
}
