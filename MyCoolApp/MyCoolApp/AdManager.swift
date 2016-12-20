//
//  AdManager.swift
//  MyCoolApp
//
//  Created by Asher   Efrati  on 19/12/2016.
//  Copyright © 2016 Asher   Efrati . All rights reserved.
//

import UIKit

class AdManager: NSObject {
    static let manager = AdManager()
    
    override init() {
        super.init()
        configAdColony()
    }
    
    func tryToShowAd(){
        guard let rootVC = UIApplication.shared.delegate?.window??.rootViewController,
            canAdColonyShowAd()
            else {
                return
        }
        
        showAdColony(on: rootVC)
    }
    
    private var didFinishConfigAdColony : Bool = false
    private var ad : AdColonyInterstitial?
    
    
    private func configAdColony(){
        
        AdColony.configure(withAppID: "app6d7ae5291b304ac1ae", zoneIDs: ["vz613d3ac73ed84af580"], options: nil) { (zone) in
            self.didFinishConfigAdColony = true
            
            self.prepareAdColony()
        }
        
    }
    
    private func prepareAdColony(){
        AdColony.requestInterstitial(inZone: "vz613d3ac73ed84af580", options: nil, success: { (newAd : AdColonyInterstitial) in
            
            self.ad = newAd
            newAd.setClose({ 
                self.prepareAdColony()
            })
            
        }, failure: nil)
    }
    
    
    
    private func canAdColonyShowAd() -> Bool{
        return didFinishConfigAdColony && ad != nil
    }
    
    private func showAdColony(on viewController : UIViewController){
        ad?.show(withPresenting: viewController)
    }
    
}
