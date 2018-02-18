//
//  ResultsViewController.swift
//  QuizApp
//
//  Created by Kurnmanbay Ayan on 2/16/18.
//  Copyright © 2018 Kurmanbay Ayan. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var time = 0
    var correctAnswers = 0
    var wrongAnswers = 0
    
    @IBOutlet var resultLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false;
        resultLabels[0].text = "Время: " + String(format: "%02d", time / 60) + ":" + String(format: "%02d", time % 60)
        resultLabels[1].text = "Правильных ответов: \(correctAnswers)"
        resultLabels[2].text = "Неправильных ответов: \(wrongAnswers)"
    }
    
}
