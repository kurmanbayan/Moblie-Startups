//
//  PickerViewController.swift
//  Taro
//
//  Created by Kurnmanbay Ayan on 2/17/18.
//  Copyright © 2018 Kurmanbay Ayan. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let themes = ["профессия", "заработная плата", "машина"]

    @IBOutlet weak var pcikerView: UIPickerView!
    @IBOutlet weak var button: UIButton!
    var theme = "профессия"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pcikerView.delegate = self
        pcikerView.dataSource = self
        buttonSetup()
    }
    
    func buttonSetup() {
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return themes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return themes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = themes[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedStringKey.font:UIFont(name: "Georgia", size: 15.0)!,NSAttributedStringKey.foregroundColor:UIColor.white])
        return myTitle
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        theme = themes[row]
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "mainSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let mainVC = segue.destination as? ViewController {
            mainVC.theme = self.theme
        }
    }
}
