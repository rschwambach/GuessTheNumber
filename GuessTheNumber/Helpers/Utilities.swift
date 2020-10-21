//
//  Utilities.swift
//  GuessTheNumber
//
//  Created by RICHARD SCHWAMBACH on 04/10/20.
//  Copyright © 2020 RICHARD SCHWAMBACH. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    static func styleTextField(_ textField: UITextField) {
        
        textField.placeholder = "Input"
        textField.textAlignment = .center
        textField.textColor = .lightGray
        textField.keyboardType = .numberPad
        textField.backgroundColor = .white
    }
    
    static func messageLabelStyle(_ label: UILabel) {
        
        label.alpha = 0
        label.backgroundColor = .gray
        label.textAlignment = .center
        label.textColor = .white
        label.font = label.font.withSize(20)
        //label.font = UIFont(name: "System Ultra Light", size: 50.0)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 4
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.gray.cgColor
    }
    
    static func numberOfTriesStyle(_ label: UILabel) {
        
        label.alpha = 1
        label.text = "Number of Tries:"
        label.textAlignment = .center
        label.textColor = .darkGray
        label.font = label.font.withSize(30)
        label.layer.masksToBounds = true
    }
    
    static func resultOfTriesStyle(_ label: UILabel) {
        
        label.alpha = 1
        label.text = "0"
        label.textAlignment = .center
        label.textColor = .darkGray
        label.font = label.font.withSize(40)
        label.layer.masksToBounds = true
    }
    
    static func emptyTextField(_ textField: UITextField) {
        
        textField.text = ""
    }
        
}
