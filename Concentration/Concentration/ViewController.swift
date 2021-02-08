//
//  ViewController.swift
//  Concentration
//
//  Created by Виктор Куля on 04.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2) {
        didSet {}
    }
    var flipCount = 0
    { didSet {
        flipCountLabel.text = "Flips: \(flipCount)"
    } }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    var emojiChoices = ["🐶", "🐱", "🦁", "🐮", "🐸", "🐻",]
    
    var emoji = [Int: String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            
        }
        return emoji[card.identifier] ?? "?"
    }
    @IBOutlet var cardButtons: [UIButton]!
    
//    @IBAction func newGameButton(_ sender: UIButton) {
//        let flipCount = 0
//        flipCountLabel.text = "Flips: \(flipCount)"
//    }
//    I will add this buttom soon
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print ("choosen card was not in cardButtons")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ?  #colorLiteral(red: 1, green: 0.7959558368, blue: 0, alpha: 0) : #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            }
        }
    }
    


}

