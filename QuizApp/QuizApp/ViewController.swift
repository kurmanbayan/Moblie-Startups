//
//  ViewController.swift
//  QuizApp
//
//  Created by Kurnmanbay Ayan on 2/13/18.
//  Copyright © 2018 Kurmanbay Ayan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var questionIndexLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet var buttons: [UIButton]!
    
    var questions = [
                     ["1", "Кто является создателем социальной сети Facebook?", "gates", "mask", "zuckerberg", "durov"],
                     ["2", "Победитель лиги чемпионов УЕФА 1990-91?", "zvezda", "barca", "real", "milan"],
                     ["3", "Какой мессенджер является самым популярным в мире", "telegram", "talk", "facebook", "whatsapp"],
                     ["4", "Какой из предложенных логотипов принадлежит файловому обменнику?", "apple", "dropbox", "huawei", "evernote"],
                     ["5", "Укажите флаг Австрии", "austria", "northkorea", "latvia", "peru"]
                    ]
    var answers = ["zuckerberg", "zvezda", "whatsapp", "dropbox", "austria"]
    var index = 0
    var total = 0
    var timer = Timer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSetup()
        getQuestions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true;
        timeLabel.text = "00:00"
        runTimer()
    }
    
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        timeLabel.text = String(format: "%02d", counter / 60) + ":" + String(format: "%02d", counter % 60)
        counter += 1
    }
    
    func getQuestions() {
        questionIndexLabel.text = "Вопрос \(questions[index][0])"
        var curIndex = 2;
        questionLabel.text = questions[index][1]
        for button in buttons {
            button.setBackgroundImage(UIImage(named: questions[index][curIndex]), for: .normal)
            curIndex += 1;
        }
    }
    
    func buttonSetup() {
        for button in buttons {
            button.layer.cornerRadius = 8
            button.layer.masksToBounds = true
        }
        submitButton.isEnabled = false
    }
    
    func clear() {
        for button in buttons {
            button.layer.borderWidth = 0
            button.layer.borderColor = UIColor.clear.cgColor
            button.isEnabled = true
        }
        submitButton.isEnabled = false
        submitButton.setTitle("Выберите вариант", for: .normal)
    }
    
    func clicked() {
        submitButton.isEnabled = true
        submitButton.setTitle("Продолжить", for: .normal)
        for button in buttons {
            button.isEnabled = false
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.layer.borderWidth = 2
        if questions[index][sender.tag] == answers[index] {
            sender.layer.borderColor = UIColor.green.cgColor
            total += 1
        }
        else {
            sender.layer.borderColor = UIColor.red.cgColor
        }
        clicked()
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        clear()
        if index < questions.count - 1 {
            index += 1
            getQuestions()
        }
        else {
            timer.invalidate()
            performSegue(withIdentifier: "ShowResults", sender: nil)
            index = 0
            total = 0
            counter = 0
            getQuestions()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultsVC = segue.destination as? ResultsViewController {
            resultsVC.time = counter;
            resultsVC.correctAnswers = total
            resultsVC.wrongAnswers = (questions.count - total)
        }
    }
    
}

