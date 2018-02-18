//
//  ViewController.swift
//  Rotating Cars
//
//  Created by Kurnmanbay Ayan on 2/8/18.
//  Copyright © 2018 Kurmanbay Ayan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    @IBOutlet weak var fourthImageView: UIImageView!
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    
    var timer = Timer()
    var isActive = false
    
    func btnSetup() {
        startButton.layer.cornerRadius = 10;
        upButton.layer.cornerRadius = 10;
        downButton.layer.cornerRadius = 10;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSetup()
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        downAction()
    }
    
    func downAction() {
        let lastImg = fourthImageView.image
        fourthImageView.image = thirdImageView.image
        thirdImageView.image = secondImageView.image
        secondImageView.image = firstImageView.image
        firstImageView.image = lastImg
    }

    @IBAction func upButtonPressed(_ sender: UIButton) {
        let firstImg = firstImageView.image
        firstImageView.image = secondImageView.image
        secondImageView.image = thirdImageView.image
        thirdImageView.image = fourthImageView.image
        fourthImageView.image = firstImg
    }

    @IBAction func downButtonPressed(_ sender: UIButton) {
        downAction()
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        isActive = !isActive
        if (!isActive) {
            timer.invalidate()
            sender.setTitle("Start", for: .normal)
        }
        else {
            runTimer()
            sender.setTitle("Stop", for: .normal)
        }
    }
    
}

