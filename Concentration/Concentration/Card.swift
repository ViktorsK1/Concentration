//
//  Card.swift
//  Concentration
//
//  Created by Виктор Куля on 07.02.2021.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        Card.identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
