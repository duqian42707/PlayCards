//
//  Card.swift
//  PlayCards
//
//  Created by admin on 2018/10/20.
//  Copyright © 2018 dqv5. All rights reserved.
//

import Foundation
class Card{
    var isMatched = false
    var isFacedUp = false
    var text:String
    
    static var idFactory = 0
    static var textFactory = ["😆","👌","👻","😂","👽","😈"]
    
    init() {
        if(Card.idFactory==0){
            Card.textFactory = ["😆","👌","👻","😂","👽","😈"]
            Card.textFactory += Card.textFactory
        }
        Card.idFactory+=1
        let index = Int(arc4random_uniform(UInt32(Card.textFactory.count)))
        text=Card.textFactory.remove(at:index)
    }
}

