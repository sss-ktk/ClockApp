//
//  01_HandDesign.swift
//  ClockApp
//
//  Created by Sota Kataoka on 3/9/23.
//

import SwiftUI

struct _1_HandDesign: View {
//    static let symbolColor = UIColor(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255, alpha: 1.0)
//    static let c2 = UIColor(red: 255 / 255, green: 79.0 / 255, blue: 191.0 / 255, alpha: 1.0)
    
    var body: some View {
        GeometryReader { geometry in
//            let width = geometry.size.width
//            let height = geometry.size.height
            
            let screenHeight = UIScreen.main.bounds.height
            let screenWidth = UIScreen.main.bounds.width
            
            let widthHalf = screenWidth / 2
                
            let symbolColor = Color(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255)
            let c2 = Color(red: 0 / 255, green: 79.0 / 255, blue: 191.0 / 255)
                
            Path { path in
                path.addLines([
                    CGPoint(x: screenWidth * 0.5 , y: screenHeight * 0.5 ),
                    CGPoint(x: screenWidth * 0.5 + 2, y: screenHeight * 0.5 + 80),
                    CGPoint(x: screenWidth * 0.5 - 2, y: screenHeight * 0.5 + 80)
                ])
            }
            .fill(c2)

//
//                path.move(to: CGPoint(x: middle, y: topHeight / 2 + spacing * 3))
//                path.addLines([
//                    CGPoint(x: middle - topWidth, y: topHeight + spacing),
//                    CGPoint(x: spacing, y: height - spacing),
//                    CGPoint(x: width - spacing, y: height - spacing),
//                    CGPoint(x: middle + topWidth, y: topHeight + spacing),
//                    CGPoint(x: middle, y: topHeight / 2 + spacing * 3)
//                ])
            
        }
    }
    
}

struct _1_HandDesign_Previews: PreviewProvider {
    static var previews: some View {
        _1_HandDesign()
    }
}
