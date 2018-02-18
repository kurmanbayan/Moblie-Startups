//
//  ViewController.swift
//  Timer
//
//  Created by Kurnmanbay Ayan on 2/8/18.
//  Copyright © 2018 Kurmanbay Ayan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var rightConstraint: NSLayoutConstraint!
    
    var timer = Timer()
    var isActive = false
    var counter = 60
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if (counter > 0) {
            counter -= 1
        }
        else {
            startBtn.isHidden = true
            startBtn.isEnabled = false
            rightConstraint.constant = view.bounds.width / 2 - startBtn.frame.width / 2;
            isActive = false
            startBtn.setTitle("Start", for: .normal)
            timer.invalidate()
        }
        timeLabel.text = String(format: "%02d", counter / 60) + ":" + String(format: "%02d", counter % 60)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = String(format: "%02d", counter / 60) + ":" + String(format: "%02d", counter % 60)
    }
    @IBAction func startBtnPressed(_ sender: UIButton) {
        isActive = !isActive
        if (isActive) {
            runTimer()
            sender.setTitle("Pause", for: .normal)
        }
        else {
            timer.invalidate()
            sender.setTitle("Start", for: .normal)
        }
    }
    @IBAction func restartBtnPressed(_ sender: UIButton) {
        counter = 60
        rightConstraint.constant = 64
        startBtn.isHidden = false
        startBtn.isEnabled = true
        timeLabel.text = String(format: "%02d", counter / 60) + ":" + String(format: "%02d", counter % 60)
    }
}

