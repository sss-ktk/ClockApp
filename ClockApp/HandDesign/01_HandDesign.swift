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
            let width = geometry.size.width
            let height = geometry.size.height
            
//            let screenHeight = UIScreen.main.bounds.height
//            let screenWidth = UIScreen.main.bounds.width
            
//            let widthHalf = screenWidth / 2
                
//            let symbolColor = Color(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255)
//            let c2 = Color(red: 0 / 255, green: 79.0 / 255, blue: 191.0 / 255)
                
            Path { path in
                path.addLines([
                    CGPoint(x: width * 0.5 , y: height * 0.5 - 130),
                    CGPoint(x: width * 0.5 + 2 , y: height * 0.5 - 120),
                    CGPoint(x: width * 0.5 + 2, y: height * 0.5 - 5),
                    CGPoint(x: width * 0.5 - 2, y: height * 0.5 - 5),
                    CGPoint(x: width * 0.5 - 2  , y: height * 0.5 - 120),
                ])
            }.fill(Color.white)
            
            Path { path in
                path.addLines([
                    CGPoint(x: width * 0.5 + 1 , y: height * 0.5 - 115),
                    CGPoint(x: width * 0.5 + 1, y: height * 0.5 - 15),
                    CGPoint(x: width * 0.5 - 1, y: height * 0.5 - 15),
                    CGPoint(x: width * 0.5 - 1  , y: height * 0.5 - 115),
                ])
            }
            .fill(Color.gray)

//            Circle()
//                .frame(width: 12, height: 12)
//                .foregroundColor(Color.white)
////                .position(x: width * 0.5, y: height * 0.5 - 10)
//                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)

        }
    }
    
}

struct _1_SecDesign: View {
//    static let symbolColor = UIColor(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255, alpha: 1.0)
//    static let c2 = UIColor(red: 255 / 255, green: 79.0 / 255, blue: 191.0 / 255, alpha: 1.0)
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
//            let screenHeight = UIScreen.main.bounds.height
//            let screenWidth = UIScreen.main.bounds.width
            
//            let widthHalf = screenWidth / 2
                
//            let symbolColor = Color(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255)
//            let c2 = Color(red: 0 / 255, green: 79.0 / 255, blue: 191.0 / 255)
                
            Path { path in
                path.addLines([
                    CGPoint(x: width * 0.5 , y: height * 0.5 - 130),
//                    CGPoint(x: width * 0.5 + 2 , y: height * 0.5 - 120),
                    CGPoint(x: width * 0.5 + 2, y: height * 0.5 - 20),
                    CGPoint(x: width * 0.5 + 3, y: height * 0.5 + 30),
                    CGPoint(x: width * 0.5 - 3, y: height * 0.5 + 30),
                    CGPoint(x: width * 0.5 - 2, y: height * 0.5 - 20),
                    
//                    CGPoint(x: width * 0.5 - 2  , y: height * 0.5 - 120),
                ])
                
                
            }.fill(Color.white)

            Circle()
                .frame(width: 12, height: 12)
                .foregroundColor(Color.white)
                .position(x: width * 0.5, y: height * 0.5 - 10)
        }
    } 
    
}

struct _1_HandDesign_Previews: PreviewProvider {
    static var previews: some View {
//        _1_SecDesign()
        _1_HandDesign()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(Color.black)
    }
}
