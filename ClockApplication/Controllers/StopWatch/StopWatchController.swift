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
    let resetOrCircleButton = BaseButton(style: .gray, mode: .title, title: "Circle")
    var circles : [StopWatchModel] = []
    
    var isTimerRunning = false
    var milliseconds = 0
    var millisecondsForCircle = 0
    var timerForCell = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureController()
        startStopButton.addTarget(self, action: #selector(startStopButtonTapped), for: .touchDown)
        resetOrCircleButton.addTarget(self, action: #selector(resetOrCircle), for: .touchDown)
        table.dataSource = self
        table.delegate = self
        setupViews()
        constraintViews()
    }
    
    func setupViews(){
        view.setupView(time)
        view.setupView(resetOrCircleButton)
        view.setupView(startStopButton)
        view.setupView(table)
    }
    
    func constraintViews(){
        NSLayoutConstraint.activate([
            time.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            time.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            resetOrCircleButton.topAnchor.constraint(equalTo: time.bottomAnchor, constant: 90),
            resetOrCircleButton.leadingAnchor.constraint(equalTo: time.leadingAnchor),
            
            startStopButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            startStopButton.topAnchor.constraint(equalTo: resetOrCircleButton.topAnchor),
            
            table.topAnchor.constraint(equalTo: startStopButton.bottomAnchor, constant: 15),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -15),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc func startStopButtonTapped(sender: UIButton){
        if isTimerRunning {
            timer.invalidate()
            timerForCell.invalidate()
            startStopButton.setupButton(style: .green, mode: .title, title: "Start")
            resetOrCircleButton.setTitleColor(.white, for: .normal)
            resetOrCircleButton.setTitle("Reset", for: .normal)
            resetOrCircleButton.backgroundColor = .customDarkGray
            } else {
                timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
                startStopButton.setupButton(style: .red, mode: .title, title: "Stop")
                resetOrCircleButton.setTitle("Circle", for: .normal)
                resetOrCircleButton.backgroundColor = .customDarkGray
                resetOrCircleButton.setTitleColor(.white, for: .normal)
                if circles.isEmpty {
                    circles.append(.init(name: "Circle 1", milliseconds: 0, color: .white))
                }
                    timerForCell = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateCircle), userInfo: nil, repeats: true)
                    table.reloadData()
                
            }
            isTimerRunning = !isTimerRunning
        }
    
    @objc func resetOrCircle(sender: UIButton){
    if isTimerRunning {
        timerForCell.invalidate()
        circles[0].milliseconds = millisecondsForCircle
        
        if  let max = circles.max(by: {$0.milliseconds>$1.milliseconds}) {
            if let maxIndex = circles.firstIndex(where: {$0.milliseconds == max.milliseconds}){
                if circles[maxIndex].milliseconds < circles[0].milliseconds{
                    circles[0].color = .red
                    print(maxIndex)
                    circles[maxIndex].color = .white
                }
            }
        }
            if  let min = circles.min(by: {$0.milliseconds<$1.milliseconds}) {
                if let minIndex = circles.firstIndex(where: {$0.milliseconds == min.milliseconds}){
                    if circles[minIndex].milliseconds > circles[0].milliseconds{
                        circles[0].color = .green
                        circles[minIndex].color = .white
                    }
                }
            }
        millisecondsForCircle = 0
        circles.insert(.init(name: "Circle \(circles.count+1)", milliseconds: millisecondsForCircle, color: .white), at: 0)
        timerForCell = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateCircle), userInfo: nil, repeats: true)
        }
        else{
            timer.invalidate()
            timerForCell.invalidate()
            milliseconds = 0
            millisecondsForCircle = 0
            time.text = "00:00,00"
            circles = []
            resetOrCircleButton.setupButton(style: .gray, mode: .title, title: "Circle")
        }
        table.reloadData()
    }
    
    @objc func updateTimer() {
        milliseconds += 1
        time.text = timeString(time: TimeInterval(milliseconds))
        }
    @objc func updateCircle(){
        millisecondsForCircle += 1
        let index = IndexPath(row: 0, section: 0)
        let cell = table.cellForRow(at: index) as? CirclesTableCell
            cell?.timeLabel.text = timeString(time: TimeInterval(millisecondsForCircle))
        
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
       return circles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CirclesTableCell", for: indexPath) as? CirclesTableCell else { fatalError()}
            cell.textLabel?.text = circles[indexPath.row].name
            cell.timeLabel.text = circles[indexPath.row].time
            cell.timeLabel.textColor = circles[indexPath.row].color
            cell.textLabel?.textColor = .white
            return cell
    
    }
}



