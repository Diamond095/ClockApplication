

import UIKit

enum Resource {
    enum Colors {
        static var separator = UIColor(hexString: "#E8ECEF")
        static var greyBackgroundColor = UIColor(hexString: "#1C1B1D")
        static var dirtyWhite = UIColor(hexString: "#C2C1C3")
        static var darkGrey = UIColor(hexString: "#1C1B1D")
        static var darkRed = UIColor(hexString: "#2F100D")
        static var darkOrange = UIColor(hexString: "#1C1B1D")
        static var darkGreen = UIColor(hexString: "#122813")
        
    }
    enum Images{
        enum TabBar {
            static var worldClock = UIImage(systemName: "globe")
            static var alarm = UIImage(systemName: "alarm.fill")
            static var stopwatch = UIImage(systemName: "stopwatch.fill")
            static var timer = UIImage(systemName: "timer")
        }
        enum Icons{
            static var plus = UIImage(systemName: "plus")
            static var play = UIImage(systemName: "play.fill")
            static var pause = UIImage(systemName: "pause.circle")
            static var continueImage = UIImage(systemName: "play.circle")
        }
    }
    enum Strings {
        enum Titles {
            static var worldClock = "World Clock"
            static var alarm = "Alarm"
            static var stopwatch = "StopWatch"
            static var timer = "Timer"
        }
        enum Repeat {
            static var everyMonday = "Every monday"
            static var everyThuesday = "Every thuesday"
            static var everyWednesday = "Every wednesday"
            static var everyThursday = "Every tursday"
            static var everyFriday = "Every friday"
            static var everySaturday = "Every saturday"
            static var everySunday = "Every sunday"
        }
    }
    
}

