//
//  TabBarController.swift
//  MyProject
//
//  Created by Ivan Basov on 26.03.24.
//

import UIKit

enum Tabs: Int{
    case worldClock
    case alarm
    case stopwatch
    case timer
}


final class TabBarController: UITabBarController {
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .all 
        cofigure()
    }
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    private func cofigure(){
        tabBar.tintColor = UIColor.systemOrange
        tabBar.barTintColor = .gray
        tabBar.backgroundColor = .black
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        let worldClockController = GlobalClockController()
        let alarmController = AlarmController()
        let stopwatchController = StopWatchController()
        let timerController = TimerController()
        
        let worldClockNavigation = NavBarController(rootViewController: worldClockController)
        let alarmNavigation = NavBarController(rootViewController:alarmController)
        let stopwatchNavigation = NavBarController(rootViewController: stopwatchController)
        let timerNavigation = NavBarController(rootViewController: timerController)
        worldClockNavigation.tabBarItem = UITabBarItem(
            title: Resource.Strings.Titles.worldClock,
            image: UIImage(systemName: "globe"),
            tag: Tabs.worldClock.rawValue
        )
        alarmNavigation.tabBarItem = UITabBarItem(
            title: Resource.Strings.Titles.alarm,
            image: UIImage(systemName: "alarm.fill"),
            tag: Tabs.alarm.rawValue
        )
        stopwatchNavigation.tabBarItem = UITabBarItem(
            title: Resource.Strings.Titles.stopwatch,
            image: UIImage(systemName: "stopwatch.fill"),
            tag: Tabs.stopwatch.rawValue
                                                    
        )
        timerNavigation.tabBarItem = UITabBarItem(
            title: Resource.Strings.Titles.timer,
            image: UIImage(systemName: "timer"),
            tag: Tabs.timer.rawValue
        )
        setViewControllers([
            worldClockNavigation,
            alarmNavigation,
            stopwatchNavigation,
            timerNavigation
        ], animated: false)
    }

}
