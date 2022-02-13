//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//
// Edited by Santiago Hernandez on 02/13/2022
//


import UIKit

class ViewController: UIViewController {

    // IBOutlets for Angela's game
    @IBOutlet weak var diceLeft: UIImageView!
    
    @IBOutlet weak var diceRight: UIImageView!
    
    
    // IBOutlets for Santiago's game
    
    @IBOutlet weak var diceImageView: UIImageView!
    
        // All of the result image holders
    
    @IBOutlet weak var result1: UIImageView!
    
    @IBOutlet weak var result2: UIImageView!
    
    @IBOutlet weak var result3: UIImageView!
    
    @IBOutlet weak var result4: UIImageView!
    
    @IBOutlet weak var result5: UIImageView!
    
    @IBOutlet weak var result6: UIImageView!
    
        // Rolls remaining, current value, and bet tabs
    
    @IBOutlet weak var rollsRemaining: UILabel!
    
    @IBOutlet weak var currentValue: UILabel!
    
    @IBOutlet weak var userBet: UITextField!
    
        // game completion label
    
    @IBOutlet weak var gameCompletLabel: UILabel!
    
    //the dice master array
    let rolls = [ #imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    
    // Turn & socore keeper
    var turn = 0
    var score = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //Actions for Angela's game
    @IBAction func diceRoll(_ sender: Any) {
        
        diceLeft.image = rolls[Int.random(in: 0...5)]
        diceRight.image = rolls[Int.random(in: 0...5)]
    }
    
    //Actions for Santiago's game
    func gameComplete(bet: String) -> String {
        let victory = Int(bet)
        
        if victory! < score - 6 {
            return "your bet was too low, you loose"
        } else if victory! > score + 6{
            return "your bet was too high, you loose"
        } else if victory! == score {
            return "right on the money!"
        } else {
            return "so close... do you want to play again?"
        }
    }
    
    @IBAction func diceRollSantiago(_ sender: Any) {
        // embed image of dice to the top
        // update score
        let randKey = Int.random(in: 0...5)
        let randDiceRoll = rolls[randKey]
        diceImageView.image = randDiceRoll
        
        switch turn {
        case 0:
            result1.image = randDiceRoll
            score += randKey + 1
            currentValue.text = String(score)
            break
        case 1:
            result2.image = randDiceRoll
            score += randKey + 1
            currentValue.text = String(score)
            break
        case 2:
            result3.image = randDiceRoll
            score += randKey + 1
            currentValue.text = String(score)
            break
        case 3:
            result4.image = randDiceRoll
            score += randKey + 1
            currentValue.text = String(score)
            break
        case 4:
            result5.image = randDiceRoll
            score += randKey + 1
            currentValue.text = String(score)
            break
        case 5:
            result6.image = randDiceRoll
            score += randKey + 1
            currentValue.text = String(score)
            gameCompletLabel.text = gameComplete(bet: userBet.text!)
            break
        default:
            break
        }
        
        turn+=1
        if turn <= 6 {
        let rollsLeft = String(6 - turn)
        rollsRemaining.text = rollsLeft
        }
    }
    
}

