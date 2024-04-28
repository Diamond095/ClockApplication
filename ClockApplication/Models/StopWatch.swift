//
//  StopWatch.swift
//  MyProject
//
//  Created by Ivan Basov on 7.04.24.
//

import Foundation

import UIKit


struct StopWatchModel {
    var name: String
    var milliseconds : Int
    var time: String {
        let minutes = milliseconds / 6000
        let seconds = milliseconds / 100 % 60
        let milliseconds = milliseconds % 100
        return String(format: "%02d:%02d:%02d", minutes, seconds, milliseconds)
    }
    var color : UIColor
}
