//
//  ViewController.swift
//  CSSwitch
//
//  Created by cheonsong on 07/22/2022.
//  Copyright (c) 2022 cheonsong. All rights reserved.
//

import Foundation
import UIKit
import CSSwitch

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let sw = CSSwitch(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        
        view.backgroundColor = .white
        view.addSubview(sw)
        
        sw.translatesAutoresizingMaskIntoConstraints = false
        
        sw.cornerRadius = sw.frame.height / 2
        sw.selectBorderColor = UIColor.blue.cgColor
        sw.selectBorderWidth = 2
        sw.borderColor = UIColor.blue.cgColor
        sw.borderWidth = 1
        sw.leftText = "left"
        sw.rightText = "right"
        sw.selectedColor = .clear
        sw.deselectedColor = .clear
        sw.deselectedTextColor = .black
        sw.selectedTextColor = .blue
        
        NSLayoutConstraint(item: sw,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1.0,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: sw,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerY,
                           multiplier: 1.0,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: sw,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .width,
                           multiplier: 1.0,
                           constant: 200).isActive = true
        
        NSLayoutConstraint(item: sw,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .height,
                           multiplier: 1.0,
                           constant: 50).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

