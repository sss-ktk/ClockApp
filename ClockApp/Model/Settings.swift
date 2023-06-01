//
//  Settings.swift
//  ClockApp
//
//  Created by Sota Kataoka on 5/31/23.
//

struct Settings {
    var timeZone: String
    var handDesign: Int
    var prefersNotificaitons = true
    var seasonalPhoto = Season.winter
//        var goalDate = Date()
    
//        static let `default` = Profile(username: "g_kumar")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
    var id: String { rawValue }

    }
}
