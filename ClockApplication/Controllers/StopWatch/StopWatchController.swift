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
    let table : UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.backgroundColor = .black
        table.backgroundColor = .black
        table.separatorColor = .white
        table.indicatorStyle = .white
        table.register(CirclesTableCell.self, forCellReuseIdentifier: "CirclesTableCell")
        return table
    }()
    
    var startStopButton = BaseButton(style: .green, mode: .title, title: "Start")
    let resetCircleButton = BaseButton(style: .gray, mode: .title, title: "Circle")
    var circles : [StopWatchModel] = []
    
    var isTimerRunning = false
    var milliseconds = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        configureController()
        startStopButton.addTarget(self, action: #selector(startStopButtonTapped), for: .touchDown)
        table.dataSource = self
        table.delegate = self
        setupViews()
        constraintViews()
    }
    
    func setupViews(){
        view.setupView(time)
        view.setupView(resetCircleButton)
        view.setupView(startStopButton)
        view.setupView(table)
    }
    
    func constraintViews(){
        NSLayoutConstraint.activate([
            time.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            time.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            resetCircleButton.topAnchor.constraint(equalTo: time.bottomAnchor, constant: 90),
            resetCircleButton.leadingAnchor.constraint(equalTo: time.leadingAnchor),
            
            startStopButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            startStopButton.topAnchor.constraint(equalTo: resetCircleButton.topAnchor),
            
            table.topAnchor.constraint(equalTo: startStopButton.bottomAnchor, constant: 15),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -15),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc func startStopButtonTapped(sender: UIButton){
        if isTimerRunning {
            timer.invalidate()
            startStopButton.setupButton(style: .green, mode: .title, title: "Start")
            resetCircleButton.setTitle("Reset", for: .normal)
            resetCircleButton.addTarget(self, action: #selector(reset), for: .touchDown)
            } else {
                timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
                startStopButton.setupButton(style: .red, mode: .title, title: "Stop")
                resetCircleButton.setTitle("Circle", for: .normal)
                resetCircleButton.backgroundColor = .customDarkGray
                resetCircleButton.setTitleColor(.white, for: .normal)
                
            }
            isTimerRunning = !isTimerRunning
        }
    
    @objc func reset(sender: UIButton){
        timer.invalidate()
        milliseconds = 0
        time.text = "00:00,00"
        resetCircleButton.setupButton(style: .gray, mode: .title, title: "Circle")
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

extension StopWatchController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CirclesTableCell", for: indexPath)
        cell.textLabel?.text = "Circle"
        cell.textLabel?.textColor = .white
        return cell
    }
    
    
}

