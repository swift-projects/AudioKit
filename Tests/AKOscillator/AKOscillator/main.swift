//
//  main.swift
//  AudioKit
//
//  Created by Aurelius Prochazka on 12/2/14.
//  Copyright (c) 2014 Aurelius Prochazka. All rights reserved.
//

import Foundation

class Instrument : AKInstrument {

    override init() {
        super.init()
        
        let oscillatingControl = AKOscillator()
        oscillatingControl.frequency = 2.ak
        connect(oscillatingControl)

        let oscillator = AKOscillator()
        oscillator.frequency = oscillatingControl.scaledBy(110.ak).plus(440.ak)
        connect(oscillator)
        connect(AKAudioOutput(audioSource:oscillator))
    }
}

let instrument = Instrument()
AKOrchestra.addInstrument(instrument)
AKOrchestra.testForDuration(10)

instrument.play()

while(AKManager.sharedManager().isRunning) {} //do nothing
println("Test complete!")
