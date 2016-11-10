//
//  FirstViewController.swift
//  UIElements
//
//  Created by Benny Davidovitz on 10/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import AVFoundation

class FirstViewController: UIViewController {

    @IBOutlet weak var volumeSlider: UISlider!
    var player : AVPlayer?
    
    static func storyboardIdentifier() -> String{
        return "FirstViewController"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        volumeSlider.sendActions(for: .valueChanged)
        
        guard let url = URL(string: "http://103.4.18.140:9998") else{
            return
        }
        
        player = AVPlayer(url: url)
        
        
        try? AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        
        do{
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
    }
    
    @IBAction func volumeSliderAction(_ sender: UISlider) {
        player?.volume = sender.value
    }
    
    var isPlaying : Bool = false{
        didSet{
            isPlaying ? player?.play() : player?.pause()
        }
    }
    
    @IBAction func togglePlayPause(_ sender : UIButton){
        self.isPlaying = !isPlaying
    }
}













