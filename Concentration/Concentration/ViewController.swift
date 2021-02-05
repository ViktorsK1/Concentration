//
//  ViewController.swift
//  Concentration
//
//  Created by Виктор Куля on 04.02.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func touchCard(_ sender: UIButton) {
        flipCard(withEmoji: "🐶", on: sender)
    }
    
    @IBAction func touchSecondCard(_ sender: UIButton) {
        flipCard(withEmoji: "🐱", on: sender)
    }
    func flipCard(withEmoji emoji: String, on button: UIButton){
        print("flipCard (withEmoji \("emoji"))")
        
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }

}

