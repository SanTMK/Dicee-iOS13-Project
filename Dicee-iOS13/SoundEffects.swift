//
//  SoundEffects.swift
//  Dicee-iOS13
//
//  Created by Santiago Hernandez on 2/20/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation
// module for playing audio files
// Audio samples from https://soundbible.com/

import AudioToolbox

// for ease of use, create a function that takes file name and extension as inputs to play them seamelessly with the rest of the code
func playSound(fileName: String, fileExtension: String) {
    //load soundName.extension
    // AudioToolbox implementation by Matt Gibson on Stack Overflow https://stackoverflow.com/a/25048225/16824128
    if let soundURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
        var mySound: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
        // Play
        AudioServicesPlaySystemSound(mySound);
    }
}
