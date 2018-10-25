//
//  ViewController.swift
//  PlayCards
//
//  Created by admin on 2018/10/20.
//  Copyright © 2018 dqv5. All rights reserved.
//

import UIKit

class PlayCardsViewController: UIViewController {
    
    var flipCount = 0
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    var cards=[Card]()
    var indexOfOnlyOneFaceUpCard:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       initCards()
    }
    func initCards(){
        flipCount=0
        cards=[Card]()
        Card.idFactory=0
        for _ in 0..<12{
            let card = Card();
            cards.append(card)
        }
        updateUIView()
    }
    
    
    @IBAction func initCards(_ sender: UIButton) {
        initCards()
    }
 
    
    @IBAction func tapButton(_ sender: UIButton) {
        let index = cardButtons.index(of: sender)!
        flipCard(index:index)
    }
    
    func flipCard(index:Int){
        if(!cards[index].isMatched){
            flipCount+=1
            if let matchIndex = indexOfOnlyOneFaceUpCard,matchIndex != index{
                if(cards[matchIndex].text == cards[index].text){
                    cards[matchIndex].isMatched=true
                    cards[index].isMatched=true
                    cards[index].isFacedUp=true
                    
                }
                cards[index].isFacedUp=true
                indexOfOnlyOneFaceUpCard=nil
            }else{
                for index2 in cards.indices{
                    cards[index2].isFacedUp=false
                }
                cards[index].isFacedUp=true
                indexOfOnlyOneFaceUpCard=index
                
            }
            updateUIView()
           
        }
        
        
    }
    
    func updateUIView(){
        countLabel.text="总次数：\(flipCount)"
        for index in cardButtons.indices{
            let card = cards[index]
            let button = cardButtons[index]
            if(card.isFacedUp){
                button.backgroundColor=#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                button.setTitle(card.text, for: UIControl.State.normal)
            }else{
                button.backgroundColor=card.isMatched ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0):#colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                button.setTitle("", for: UIControl.State.normal)
            }
        }
    }
    
}

