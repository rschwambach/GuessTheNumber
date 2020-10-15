//
//  WinViewController.swift
//  GuessTheNumber
//
//  Created by RICHARD SCHWAMBACH on 13/10/20.
//  Copyright © 2020 RICHARD SCHWAMBACH. All rights reserved.
//

import UIKit

class WinViewController: UIViewController {
    
    @IBOutlet weak var rightNumber: UILabel!
    @IBOutlet weak var numberTries: UILabel!
    var rightNumberToPrint: Int = 0
    var numberTriesToPrint: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
        rightNumber.text = String(rightNumberToPrint)
        numberTries.text = String(numberTriesToPrint)
    }
    
    //FUNCTION TO SET UP THE UI STYLE
    func setUpElements() {
        
        Utilities.resultOfTriesStyle(rightNumber)
        Utilities.resultOfTriesStyle(numberTries)
    }

}
