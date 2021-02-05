//
//  ViewController.swift
//  Concentration
//
//  Created by Виктор Куля on 04.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount = 0
    { didSet {
        flipCountLabel.text = "Flips: \(flipCount)"
    } }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    var emojiChoices = ["🐶", "🐱", "🐶", "🐱"]
    @IBOutlet var cardButtons: [UIButton]!
    
//    @IBAction func newGameButton(_ sender: UIButton) {
//        let flipCount = 0
//        flipCountLabel.text = "Flips: \(flipCount)"
//    }
//    I will add this buttom soon
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
        flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print ("choosen card was not in cardButtons")
        }
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton){

        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.7959558368, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }

}

