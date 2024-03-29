//
//  02_HandDesign.swift
//  ClockApp
//
//  Created by Sota Kataoka on 4/2/23.
//

import SwiftUI


struct _2_HandDesign: View {
//    static let symbolColor = UIColor(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255, alpha: 1.0)
//    static let c2 = UIColor(red: 255 / 255, green: 79.0 / 255, blue: 191.0 / 255, alpha: 1.0)
//    let clockConfiguration: ClockConfiguration
    var color: Color
    var body: some View {
//        var color = clockConfiguration.handColor

        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height

            
            Path { path in
                path.addLines([
                    CGPoint(x: width * 0.5 , y: height * 0.5 - 150),
                    CGPoint(x: width * 0.5 + 2 , y: height * 0.5 - 140),
                    CGPoint(x: width * 0.5 + 2, y: height * 0.5 - 5),
                    CGPoint(x: width * 0.5 - 2, y: height * 0.5 - 5),
                    CGPoint(x: width * 0.5 - 2  , y: height * 0.5 - 140),
                ])
            }.fill(color)
            
            Path { path in
                path.addLines([
                    CGPoint(x: width * 0.5 + 1 , y: height * 0.5 - 135),
                    CGPoint(x: width * 0.5 + 1, y: height * 0.5 - 15),
                    CGPoint(x: width * 0.5 - 1, y: height * 0.5 - 15),
                    CGPoint(x: width * 0.5 - 1  , y: height * 0.5 - 135),
                ])
            }
            .fill(color)
            .opacity(0.8)

        }
    }
    
}

struct _2_MinDesign: View {
//    let clockConfiguration: ContentView.ClockConfiguration
    let color : Color
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
//            let configColor = clockConfiguration.color

            Path { path in
                path.addLines([
                    CGPoint(x: width * 0.5 , y: height * 0.5 - 110),
                    CGPoint(x: width * 0.5 + 2 , y: height * 0.5 - 100),
                    CGPoint(x: width * 0.5 + 2, y: height * 0.5 - 5),
                    CGPoint(x: width * 0.5 - 2, y: height * 0.5 - 5),
                    CGPoint(x: width * 0.5 - 2  , y: height * 0.5 - 100),
                ])
            }.fill(color)
            
            Path { path in
                path.addLines([
                    CGPoint(x: width * 0.5 + 1 , y: height * 0.5 - 95),
                    CGPoint(x: width * 0.5 + 1, y: height * 0.5 - 15),
                    CGPoint(x: width * 0.5 - 1, y: height * 0.5 - 15),
                    CGPoint(x: width * 0.5 - 1  , y: height * 0.5 - 95),
                ])
            }
            .fill(color)
//            .opacity(0.2)
    
        }
    }
    
}


struct _2_SecDesign: View {
//    static let symbolColor = UIColor(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255, alpha: 1.0)
//    static let c2 = UIColor(red: 255 / 255, green: 79.0 / 255, blue: 191.0 / 255, alpha: 1.0)
    let color : Color
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
                
            Path { path in
                path.addLines([
                    CGPoint(x: width * 0.5 , y: height * 0.5 - 150),
                    CGPoint(x: width * 0.5 + 2, y: height * 0.5 - 20),
                    CGPoint(x: width * 0.5 + 3, y: height * 0.5 + 30),
                    CGPoint(x: width * 0.5 - 3, y: height * 0.5 + 30),
                    CGPoint(x: width * 0.5 - 2, y: height * 0.5 - 20)
                ])
                
                
            }.fill(Color.white)

            Circle()
                .frame(width: 12, height: 12)
                .foregroundColor(Color.white)
                .position(x: width * 0.5, y: height * 0.5 - 10)
        }
    } 
    
}

struct _2_HandDesign_Previews: PreviewProvider {
    static var previews: some View {
        _2_SecDesign(color: .blue)
//        _2_HandDesign(color: .blue)
//        _2_MinDesign(color: .blue)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(Color.black)

    }
}
