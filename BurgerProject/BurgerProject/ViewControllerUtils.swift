//
//  ViewControllerUtils.swift
//  BurgerProject
//
//  Created by Benny Davidovitz on 12/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import MFSideMenu

extension UIViewController{
    @IBAction func rightBarButtonItemAction(){
        self.menuContainerViewController?.toggleRightSideMenuCompletion(nil)
    }
    
    @IBAction func leftBarButtonItemAction(){
        self.menuContainerViewController?.toggleLeftSideMenuCompletion(nil)
    }
    /*
    func setupBackground(){
        view.backgroundColor = .red
    }
 */
}
/*
class BaseViewController : UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
    }
}

class BaseTableViewController : UITableViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
    }
}
*/
