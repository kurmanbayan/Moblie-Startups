//
//  ViewController.swift
//  Calculator
//
//  Created by Kurnmanbay Ayan on 2/17/18.
//  Copyright © 2018 Kurmanbay Ayan. All rights reserved.
//

import UIKit

extension String {
    func crop(from: Int, length: Int) -> String! {
        let startIndex = self.index(self.startIndex, offsetBy: from)
        
        var result = self.substring(from: startIndex)
        
        let endIndex = result.index(result.startIndex, offsetBy: length)
        result = result.substring(to: endIndex)
        
        return result
    }
}

class ViewController: UIViewController {
    
    var firstNumber = ""
    var secondNumber = ""
    var operation = ""
    
    @IBOutlet weak var calculationLabel: UILabel!
    
    @IBAction func onDigitButtonPressed(_ sender: UIButton) {
        if sender.currentTitle! == "0" {
            if calculationLabel.text != "0" {
                calculationLabel.text! += sender.currentTitle!
            }
        }
        else {
            if calculationLabel.text == "0" {
                calculationLabel.text! = sender.currentTitle!
            }
            else {
                calculationLabel.text! += sender.currentTitle!
            }
        }
        divideResultWithSpace(calculationLabel.text!)
    }
    
    func divideResultWithSpace(_ current: String) {
        let label = deleteSpaces(current)
        var finalLabel = ""
        var k = 3
        while(k <= label.count) { // here I crop each substring with length: 3, and add space between these substrings
            finalLabel = label.crop(from: label.count - k, length: 3) + " " + finalLabel // we start from last index
            k += 3;
        }
        if (label.count % 3 != 0) { // if there is reminder not equal to 0, it means like 1 123 or 12 345
            finalLabel = label.crop(from: 0, length: label.count % 3) + " " + finalLabel
        }
        calculationLabel.text = finalLabel
    }
    
    func deleteSpaces(_ current: String) -> String { // in this function I remove all spaces which came from calculationLabel
        var label = ""
        for char in current.enumerated() {
            if String(char.element) != " " {
                label = label + String(char.element)
            }
        }
        return label
    }
    
    @IBAction func removeButtonPressed(_ sender: UIButton) {
        let label = deleteSpaces(calculationLabel.text!)
        
        if label.count > 0 {
            divideResultWithSpace(label.crop(from: 0, length: label.count - 1))
        }
        if calculationLabel.text!.count == 0 {
            calculationLabel.text = "0"
        }
    }
    
    @IBAction func onOperationButtonPressed(_ sender: UIButton) {
        if calculationLabel.text != "" {
            firstNumber = deleteSpaces(calculationLabel.text!)
        }
        calculationLabel.text = ""
        operation = sender.currentTitle!
    }
    @IBAction func onResultButtonPressed(_ sender: UIButton) {
        if calculationLabel.text != "" {
            secondNumber = deleteSpaces(calculationLabel.text!)
        }
        var result: Int?
        switch operation {
        case "/":
            if Int(secondNumber) == 0 {
                calculationLabel.text = "Error"
            }
            else {
                result = Int(firstNumber)! / Int(secondNumber)!
            }
        case "+":
            result = Int(firstNumber)! + Int(secondNumber)!
        case "-":
            result = Int(firstNumber)! - Int(secondNumber)!
        case "x":
            result = Int(firstNumber)! * Int(secondNumber)!
        case "%":
            result = Int(secondNumber)! * Int(firstNumber)! / 100
        default:
            result = 0
        }
        if let result = result {
            divideResultWithSpace("\(result)")
        }
    }
    
    @IBAction func onClearButtonPressed(_ sender: UIButton) {
        firstNumber = ""
        secondNumber = ""
        operation = ""
        calculationLabel.text = "0"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

