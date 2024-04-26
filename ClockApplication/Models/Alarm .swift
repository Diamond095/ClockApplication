//
//  Alarm .swift
//  MyProject
//
//  Created by Ivan Basov on 7.04.24.
//

import Foundation

enum Repeat {
    static var everyMonday = "Every monday"
    static var everyThuesday = "Every thuesday"
    static var everyWednesday = "Every wednesday"
    static var everyThursday = "Every tursday"
    static var everyFriday = "Every friday"
    static var everySaturday = "Every saturday"
    static var everySunday = "Every sunday"
}

struct Alarm {
    
    var time : Date
    var name : String
    var repeatAlarm : Repeat
    var melody : String
    var repeatSignal : Bool
    var activeStatus : Bool
}

struct RepeatAlarm {
    var name : String
    
    static func createRepeats() -> [RepeatAlarm]{
        return [
            .init(name:"Every monday"),
            .init(name: "Every thuesday"),
            .init(name:"Every wednesday"),
            .init(name: "Every tursday"),
            .init(name:"Every friday"),
            .init(name: "Every saturday"),
            .init(name: "Every sunday")
        ]
    }
}

