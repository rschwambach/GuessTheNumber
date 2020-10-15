//
//  GameViewController.swift
//  GuessTheNumber
//
//  Created by RICHARD SCHWAMBACH on 04/10/20.
//  Copyright © 2020 RICHARD SCHWAMBACH. All rights reserved.
//

import Foundation
import UIKit


class GameViewController: UIViewController {
    
    @IBOutlet weak var guessInput: UITextField!
    @IBOutlet weak var tryItButton: UIButton!
    @IBOutlet weak var numberOfTriesLabel: UILabel!
    @IBOutlet weak var resultOfTriesLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    var randomResult: Int? = nil
    var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpElements()
        
    }
    
    //FUNCTION TO SET UP THE UI STYLE
    func setUpElements() {
        
        Utilities.styleTextField(guessInput)
        Utilities.numberOfTriesStyle(numberOfTriesLabel)
        Utilities.resultOfTriesStyle(resultOfTriesLabel)
        Utilities.messageLabelStyle(messageLabel)
    }
    
    //FUNCTION TRYIT PRESSED
    @IBAction func tryItPressed(_ sender: Any) {
        
        let guessInputed = Int(guessInput.text!)
        
        if guessInputed != nil {
            
            if guessInputed! < randomResult! {
                messageLabel.alpha = 1
                messageLabel.text = "Number is Higher Than \(guessInputed!)"
                counter += 1
                resultOfTriesLabel.text = String(counter)
                guessInput.text = ""
                dismissMyKeyboard()
            }
            else if guessInputed! > randomResult! {
                
                messageLabel.alpha = 1
                messageLabel.text = "Number is Lower Than \(guessInputed!)"
                counter += 1
                resultOfTriesLabel.text = String(counter)
                guessInput.text = ""
                dismissMyKeyboard()
            }
            else {
                
                counter += 1
                resultOfTriesLabel.text = String(counter)
                performSegue(withIdentifier: "winView", sender: self)
            }
        }
        else {
            
            messageLabel.alpha = 1
            messageLabel.text = "Input a Number in the Field"
            dismissMyKeyboard()
        }
    }
    
    //FUNCTION OVERRIDE SEGUE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? WinViewController {
            vc.rightNumberToPrint = randomResult!
            vc.numberTriesToPrint = counter
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    func dismissMyKeyboard() {
        
        view.endEditing(true)
    }

}
