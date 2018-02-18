//
//  ViewController.swift
//  Taro
//
//  Created by Kurnmanbay Ayan on 2/16/18.
//  Copyright © 2018 Kurmanbay Ayan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    
    var timer = Timer.init()
    var index = 1
    var theme = ""
    
    var list = ["профессия": ["Сантехник", "Пожарный", "Космонавт", "Переводчик", "Бухгалтер", "Врач", "Следователь", "Астроном", "Агроном", "Футболист", "Актер", "Инженер", "Повар", "Пилот", "Эколог"],
        "машина": ["Bentley", "Lada", "Toyota", "Wolksvagen", "GMC", "Dodge", "Chevrolet", "Audi", "Nissan", "Mercedes", "Tesls", "Land Rover", "Lamborghini", "Infinity", "Ferarri", "Honda"],
        "заработная плата": ["5000 USD", "1500 USD", "2000 USD", "7809 USD", "6854 USD", "1378 USD", "3196 USD", "6952 USD", "4400 USD", "3732 USD", "9694 USD", "6530 USD", "3442 USD", "1321 USD", "5515 USD", "2091 USD", "6847 USD", "4952 USD"]
        ]
    
    func setNavigationBar() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSetup()
        setNavigationBar()
        mainLabel.text = list[theme]?[0]
        titleLabel.text = "Моя будущая \(theme)"
    }
    
    func buttonSetup() {
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.setTitle("Старт", for: .normal)
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        let size = list[theme]?.count
        mainLabel.text = list[theme]?[index % size!]
        index += 1
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        if button.titleLabel?.text == "Старт" {
            button.setTitle("Стоп", for: .normal)
            runTimer()
        }
        else {
            timer.invalidate()
            button.setTitle("Старт", for: .normal)
        }
    }
    


}

