//
//  StopWatchController.swift
//  MyProject
//
//  Created by Ivan Basov on 4.04.24.
//



import UIKit

final class StopWatchController : UIViewController{
    
    var timer = Timer()
    let time : UILabel = {
        let time = UILabel()
        time.font = UIFont.systemFont(ofSize: 95, weight: .ultraLight)
        time.text = "00:00,00"
        time.textColor = .white
        return time
    }()
    var startStopButton = BaseButton(style: .green, mode: .title, title: "Start")
    let resetButton = BaseButton(style: .gray, mode: .title, title: "Reset")
    
    var isTimerRunning = false
    var milliseconds = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        configureController()
        startStopButton.addTarget(self, action: #selector(startStopButtonTapped), for: .touchDown)
        setupViews()
       // startStopButton.addTarget(self, action: #selector(startStopButtonTapped), for: .valueChanged)
        constraintViews()
        
    }
    func setupViews(){
        view.setupView(time)
        view.setupView(resetButton)
        view.setupView(startStopButton)
    }
    func constraintViews(){
        NSLayoutConstraint.activate([
            time.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            time.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            resetButton.topAnchor.constraint(equalTo: time.bottomAnchor, constant: 50),
            resetButton.leadingAnchor.constraint(equalTo: time.leadingAnchor),
            startStopButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            startStopButton.topAnchor.constraint(equalTo: resetButton.topAnchor)
            
        ])
    }
    @objc func startStopButtonTapped(sender: UIButton){
        if isTimerRunning {
                timer.invalidate()
                startStopButton.setTitle("Start", for: .normal)
            } else {
                timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
                
            }
            isTimerRunning = !isTimerRunning
        }
    @objc func updateTimer() {
        milliseconds += 1
        time.text = timeString(time: TimeInterval(milliseconds))
        }
    func timeString(time: TimeInterval) -> String {
        let minutes = Int(time) / 6000
        let seconds = Int(time) / 100 % 60
        let milliseconds = Int(time) % 100
        return String(format: "%02d:%02d:%02d", minutes, seconds, milliseconds)


}
    }

