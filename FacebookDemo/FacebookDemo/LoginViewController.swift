//
//  LoginViewController.swift
//  FacebookDemo
//
//  Created by Benny Davidovitz on 12/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin

class LoginViewController: UIViewController, LoginButtonDelegate {

    @IBOutlet weak var loginButtonContainer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let permission = ReadPermission.custom("read_custom_friendlists")
        
        let loginButton = LoginButton(readPermissions: [ .publicProfile , .userFriends, permission])
        
        loginButton.frame = loginButtonContainer.bounds
        loginButton.delegate = self
        
        loginButtonContainer.addSubview(loginButton)
    }

    //MARK: - Login Button Delegate
    
    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        if AccessToken.current != nil{
            print("logged in")
            UIApplication.shared.delegate?.window??.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        } else {
            print("not logged in")
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        
    }

}












