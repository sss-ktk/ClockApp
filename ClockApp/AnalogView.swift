//
//  AnalogView.swift
//  ClockApp
//
//  Created by Sota Kataoka on 4/5/23.
//

import SwiftUI

struct AnalogView: View {
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        GeometryReader { geometry in
            
            let w = geometry.size.width
            let h = geometry.size.height
            
            VStack{
                ZStack{
                    TimeMark()
                    Demo(timeZone: TimeZone(identifier: "Asia/Tokyo")!)
                }
                .position(x: w/2, y: h/20)
                .scaleEffect(0.8) //scale up or down
                
                ZStack{
                    TimeMark()
                    Demo(timeZone: TimeZone(identifier: "America/Los_Angeles")!)
                }
                .position(x: w/2, y: h/40)
                .scaleEffect(0.8) //scale up or down

            }
        }
        
    }
}

struct AnalogView_Previews: PreviewProvider {
    static var previews: some View {
        AnalogView()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(Color.black)
    }
}
