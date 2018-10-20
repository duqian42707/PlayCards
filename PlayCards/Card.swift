//
//  Card.swift
//  PlayCards
//
//  Created by admin on 2018/10/20.
//  Copyright © 2018 dqv5. All rights reserved.
//

import Foundation
class Card{
    var id:Int
    var isMatched = false
    var isFacedUp = false
    var text:String
    
    static var idFactory = 0
    static var textFactory = ["😆","👌","👻","😂","👽","😈"]
    init() {
        Card.idFactory+=1
        id=Card.idFactory
        var index = id-1
        if(index>=6){
            index = index-6
        }
        text=Card.textFactory[index]
    }
}

