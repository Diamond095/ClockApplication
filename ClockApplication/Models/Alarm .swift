//
//  Alarm .swift
//  MyProject
//
//  Created by Ivan Basov on 7.04.24.
//

import Foundation

struct Alarm {
    var time : Date
    var name : String
    var repeatAlarm : Resource.Strings.Repeat
    var melody : String
    var repeatSignal : Bool
    var activeStatus : Bool
}
