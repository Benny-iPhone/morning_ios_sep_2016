//
//  Settings.swift
//  CellFromXIB
//
//  Created by Benny Davidovitz on 24/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class Settings: NSObject {
    static let shared = Settings()
    
    var sound : Bool{
        didSet{
            UserDefaults.standard.set(sound, forKey: "sound")
        }
    }
    var wifiOnly : Bool{
        didSet{
            UserDefaults.standard.set(wifiOnly, forKey: "wifi")
        }
    }
    
    override init() {
        let userDefaults = UserDefaults.standard
        sound = userDefaults.bool(forKey: "sound")
        wifiOnly = userDefaults.bool(forKey: "wifi")
        
        super.init()
    }
    
    deinit {
        UserDefaults.standard.synchronize()
    }
}





















