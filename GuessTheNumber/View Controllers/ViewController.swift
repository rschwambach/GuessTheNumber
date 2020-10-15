//
//  ViewController.swift
//  GuessTheNumber
//
//  Created by RICHARD SCHWAMBACH on 18/09/20.
//  Copyright © 2020 RICHARD SCHWAMBACH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputNumberOne: UITextField!
    @IBOutlet weak var inputNumberTwo: UITextField!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    var resultRandom: Int? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpElements()

    }
    
    
    //FUNCTION TO CALL PLAY THE GAME
    @IBAction func playTapped(_ sender: Any) {
        
        let numberInputedOne = Int(inputNumberOne.text!)
        let numberInputedTwo = Int(inputNumberTwo.text!)
        
        if numberInputedOne != nil && numberInputedTwo != nil {
            
            if numberInputedOne! > numberInputedTwo! {
                
                messageLabel.alpha = 1
                messageLabel.text = "Second Input is Lower Than The First Input"
                dismissMyKeyboard()
                
            }
            else if numberInputedOne == numberInputedTwo {
                
                messageLabel.alpha = 1
                messageLabel.text = "Both Numbers are the Same"
                dismissMyKeyboard()
            }
            else {
                
                messageLabel.alpha = 0
                randomizeNumber()
                performSegue(withIdentifier: "segueGameView", sender: self)
                inputNumberOne.text = ""
                inputNumberTwo.text = ""
            }
        }
        else {
            
            messageLabel.alpha = 1
            messageLabel.text = "Insert Some Value in the Fields"
            dismissMyKeyboard()
        }
        
    }
    
    //FUNCTION TO RANDOMIZE NUMBERS INPUTTED
    func randomizeNumber() {
        
        let numberInputedOne = Int(inputNumberOne.text!)
        let numberInputedTwo = Int(inputNumberTwo.text!)
        
        let resultOfTheRandom = Int.random(in: numberInputedOne!...numberInputedTwo!)
        print(resultOfTheRandom)
        resultRandom = resultOfTheRandom
        print(resultRandom!)
    }
    
    //FUNCTION TO SET UP THE UI STYLE
    func setUpElements() {
        
        Utilities.styleTextField(inputNumberOne)
        Utilities.styleTextField(inputNumberTwo)
        Utilities.messageLabelStyle(messageLabel)
    }
    
    //FUNCTION TO MAKE THE SEGUE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? GameViewController {
            vc.randomResult = resultRandom
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    func dismissMyKeyboard() {
        
        view.endEditing(true)
    }
    
}

