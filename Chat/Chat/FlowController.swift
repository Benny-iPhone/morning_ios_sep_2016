//
//  FlowController.swift
//  Chat
//
//  Created by Benny Davidovitz on 01/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import Firebase

class FlowController: NSObject {
    enum Mode{
        case login
        case main
        
        func storyboardName() -> String{
            switch self {
            case .login: return "Login"
            case .main: return "Main"
            }
        }
    }
    
    static let controller = FlowController()
    
    var mode : Mode
    
    override init() {
        mode = FIRAuth.auth()?.currentUser == nil ? .login : .main
        
        super.init()
    }
    
    func determineRoot(){
        mode = FIRAuth.auth()?.currentUser == nil ? .login : .main
        updateRoot()
    }
    
    func updateRoot(){
        if Thread.isMainThread == false{
            //move to main thread if not
            DispatchQueue.main.async {
                self.updateRoot()
            }
            return
        }
        
        let storyboard = UIStoryboard(name: mode.storyboardName(), bundle: nil)
        let rootVC = storyboard.instantiateInitialViewController()
        UIApplication.shared.delegate?.window??.rootViewController = rootVC
    }
    
}

















