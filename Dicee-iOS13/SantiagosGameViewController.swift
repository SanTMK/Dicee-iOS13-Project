//
//  SantiagosGameViewController.swift
//  Dicee-iOS13
//
//  Created by Santiago Hernandez on 2/20/22.
//  Copyright © 2022 London App Brewery. All rights reserved.


import UIKit


class SantiagosGameViewController: UIViewController {

    //Dice Outlet
    @IBOutlet weak var diceImageView: UIImageView!
    
    //Target image view outlets
    
    @IBOutlet weak var result1: UIImageView!
    
    @IBOutlet weak var result2: UIImageView!
    
    @IBOutlet weak var result3: UIImageView!
    
    @IBOutlet weak var result4: UIImageView!
    
    @IBOutlet weak var result5: UIImageView!
    
    @IBOutlet weak var result6: UIImageView!
    
    //Game dashboard outlets
    @IBOutlet weak var rollsRemaining: UILabel!
    
    @IBOutlet weak var currentValue: UILabel!
    
    @IBOutlet weak var userBet: UITextField!
    
    //Game completion label
    
    @IBOutlet weak var gameCompleteLabel: UILabel!
    
    // Game Reset function
    func gameRestart() {
        //Clear image targets
        result1.image = nil
        result2.image = nil
        result3.image = nil
        result4.image = nil
        result5.image = nil
        result6.image = nil
        
        //Set the rest of the dashboard back to its original values.
        rollsRemaining.text = "6"
        currentValue.text = "0"
        gameCompleteLabel.text = "Place your bet!"
        
        //Reset turn and score to start over
        turn = 0
        score = 0
    }
    
    
    //the dice master array
        let rolls = [ #imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
        
    // Turn & socore keeper
        var turn = 0
        var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //gameComplete function determines the message displayed to users upon completion of the game.
       func gameComplete(bet: String) -> String {
           
           //I do not understand why, but the code will not compile if useBet is not cast as an optional variable (Int32?) with the question mark.
           let userBet: Int32? = Int32(bet)
           let playAgainMsg = "roll the dice to play again"
           
           //Logic gate to determine message. Number three chosen because it's a lucky number (arbitrary) 🤷‍♂️
           if userBet! < score - 3 {
               playSound(fileName: "sad_trombone", fileExtension: "wav")
               return "your bet was too low, you loose\n\(playAgainMsg)"
           } else if userBet! > score + 3 {
               playSound(fileName: "sad_trombone", fileExtension: "wav")
               return "your bet was too high, you loose\n\(playAgainMsg)"
           } else if userBet! == score {
               playSound(fileName: "applause_sound", fileExtension: "wav")
               return "right on the money!\n\(playAgainMsg)"
           } else {
               return "so close... do you want to play again?\n\(playAgainMsg)"
           }
       }
    
       //Dice roll button event listener
       @IBAction func diceRollSantiago(_ sender: Any) {
           
           //Invoke function to play dice sound effects
           playSound(fileName: "dice_sound", fileExtension: "wav")
           
           //Display instructions on how to continue the game
           gameCompleteLabel.text = "continue rolling the dice until \ncompleting six rolls."
           
           // embed image of dice to the top
           // update score
           let randKey = Int.random(in: 0...5)
           let randDiceRoll = rolls[randKey]
           diceImageView.image = randDiceRoll
           
           // update score and currentValue
           if turn <= 5 {
               score += randKey + 1
               currentValue.text = String(score)
           }
           
           // logic switch determines which image view to target and embeds the image.
           //It is repetitive, but I could not think of another soluiton.
           switch turn {
           case 0:
               result1.image = randDiceRoll
               break
           case 1:
               result2.image = randDiceRoll
               break
           case 2:
               result3.image = randDiceRoll
               break
           case 3:
               result4.image = randDiceRoll
               break
           case 4:
               result5.image = randDiceRoll
               break
           case 5:
               // Last roll must display the gameComplete message
               result6.image = randDiceRoll
               gameCompleteLabel.text = gameComplete(bet: userBet.text!)
               break
               //Add error message just in case something goes wrong
           default:
               gameCompleteLabel.text = "Unexpected error. Try restarting the app"
               break
           }
           
           //Update turn value and use it to update rollsRemaining
           turn+=1
           if turn <= 6 {
           let rollsLeft = String(6 - turn)
           rollsRemaining.text = rollsLeft
           } else {
               gameRestart() //The seventh roll automatically resets the game
           }
           
           //Check for bet; if not set, reset game
           
           if userBet.text!.isEmpty {
               gameRestart()
               gameCompleteLabel.text = "The game will not start \nif 'Bet' is left empty"
           }
       }

}
