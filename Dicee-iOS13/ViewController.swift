//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//
// Forked by Santiago Hernandez on 02/13/2022
//
//  Enhancements:
//  1) Organized the app into multiple view controllers
//  2) Added new game to Dicee app
//  3) Added sound effects to app.


import UIKit

class ViewController: UIViewController {

    // IBOutlets for Angela's game
    @IBOutlet weak var diceLeft: UIImageView!
    
    @IBOutlet weak var diceRight: UIImageView!
    
    //the dice master array
    let rolls = [ #imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //Actions for Angela's game
    @IBAction func diceRoll(_ sender: Any) {
        
        //invoke sound effects function
        playSound(fileName: "dice_sound", fileExtension: "wav")
        
        //generate a random index number so select from the rolls array and assign to imageviews
        diceLeft.image = rolls[Int.random(in: 0...5)]
        diceRight.image = rolls[Int.random(in: 0...5)]
    }
    // Play poker chip noices when entering a game
    @IBAction func SantiagosGameButton(_ sender: UIButton) {
        playSound(fileName: "chips_sound", fileExtension: "wav")
    }
    
    @IBAction func AngelasGameButton(_ sender: UIButton) {
        playSound(fileName: "chips_sound", fileExtension: "wav")
    }
    
}
    


