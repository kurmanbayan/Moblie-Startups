//
//  ViewController.swift
//  Color Change
//
//  Created by Kurnmanbay Ayan on 1/27/18.
//  Copyright © 2018 Kurmanbay Ayan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    func mainBtn(_ button: UIButton, _ title: String) -> UIButton {
        button.backgroundColor = .blue
        button.layer.cornerRadius = 20
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }
    
    func setBtn(_ divWid: CGFloat, _ divHei: CGFloat, _ width: CGFloat, _ add: CGFloat) -> UIButton {
        let button = UIButton(frame: CGRect(x: add + view.bounds.width / divWid  - width / 2, y: view.bounds.height / divHei, width: width, height: 40))
        return button;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(mainBtn(setBtn(2, 4, 180, 0), "Bronze"))
        self.view.addSubview(mainBtn(setBtn(4, 2, 120, 0), "Silver"))
        self.view.addSubview(mainBtn(setBtn(4, 2, 120, view.bounds.width / 2), "Gold"))
        
        view.backgroundColor = .red
        self.navigationController?.isNavigationBarHidden = true;
    }
    
    @objc func buttonAction(sender: UIButton!) {
        let title = sender.titleLabel!.text
        if (title == "Gold") {
            if let color = sender.backgroundColor {
                sender.backgroundColor = view.backgroundColor
                view.backgroundColor = color
            }
        }
        else if (title == "Silver") {
            sender.backgroundColor = UIColor(red: 0, green: 0, blue: CGFloat(drand48()), alpha: 1.0)
            view.backgroundColor = UIColor(red: 0, green: CGFloat(drand48()), blue: 0, alpha: 1.0)
        }
        else {
            sender.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
        }
    }


}

