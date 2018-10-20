//
//  ViewController.swift
//  PlayCards
//
//  Created by admin on 2018/10/20.
//  Copyright © 2018 dqv5. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount = 0 {
        didSet{
            countLabel.text="总次数：\(flipCount)"
        }
    }
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    var cards=[Card]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for _ in 0..<12{
            let card = Card();
            cards.append(card)
        }
    }
    
    @IBAction func tapButton(_ sender: UIButton) {
        
        let index = cardButtons.index(of: sender)!
        let card = cards[index]
        flipCard(card:card,button:sender)
    }
    
    func flipCard(card:Card,button:UIButton){
        if(!card.isMatched){
            flipCount+=1
            updateUIView(button:button,card:card)
            card.isFacedUp=(!card.isFacedUp)
        }
        
        
    }
    
    func updateUIView(button:UIButton,card:Card){
        if(card.isFacedUp){
            button.backgroundColor=#colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            button.setTitle("", for: UIControl.State.normal)
        }else{
            button.backgroundColor=#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            button.setTitle(card.text, for: UIControl.State.normal)
        }
    }
    
}

