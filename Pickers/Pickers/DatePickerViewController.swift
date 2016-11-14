//
//  DatePickerViewController.swift
//  Pickers
//
//  Created by Benny Davidovitz on 14/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import MZTimerLabel
import AVFoundation

class DatePickerViewController: UIViewController {

    @IBOutlet weak var timerLabel: MZTimerLabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var dogPlayer : AVAudioPlayer?
    var beepPlayer : AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerLabel.timerType = MZTimerLabelTypeTimer
        timerLabel.timeFormat = "HH:mm:ss.SSS"
        
        setupPlayers()
    }
    
    func setupPlayers(){
        guard let dogUrl = Bundle.main.url(forResource: "dog", withExtension: "wav"),
            let beepURL = Bundle.main.url(forResource: "beep", withExtension: "wav")
            else {
                return
        }
        
        dogPlayer = try? AVAudioPlayer(contentsOf: dogUrl)
        beepPlayer = try? AVAudioPlayer(contentsOf: beepURL)
        
    }
    
    //MARK: - IBActions
    
    var timer : Timer?
    
    @IBAction func startAction(_ sender: Any) {
        
        timerLabel.reset()
        
        timerLabel.setCountDownTime(datePicker.countDownDuration)
        timerLabel.start { _ in
            self.dogPlayer?.play()
            //stop timer
            self.timer?.invalidate()
        }
        
        //was NSTimer, now Timer
        timer = Timer.scheduledTimer(withTimeInterval: 10 /* seconds */, repeats: true, block: {_ in
            self.beepPlayer?.play()}
        )
        
    }
    
    
    
    

}
