//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//
// Edited by Santiago Hernandez on 02/13/2022
//
//  Enhancements:
//  1) Separated game into multiple view controllers
//  2) Added new game to Dicee app
//  3) Added sound effects to app.


import UIKit
// module for playing audio files
// Audio samples from https://soundbible.com/
import AVFoundation

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
        
        diceLeft.image = rolls[Int.random(in: 0...5)]
        diceRight.image = rolls[Int.random(in: 0...5)]
    }
  
}

