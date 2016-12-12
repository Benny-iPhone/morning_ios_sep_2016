//
//  MenuTableViewController.swift
//  BurgerProject
//
//  Created by Benny Davidovitz on 12/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import MessageUI

class MenuTableViewController: UITableViewController {
    enum Row : Int{
        case first = 0
        case second = 1
        case contactUs
        
        static let count = 3
        
        func title() -> String{
            switch self {
            case .first: return "First Screnn"
            case .second: return "Second Screen"
            case .contactUs: return "Contact Us"
            }
        }
    }
    
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Row.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = Row(rawValue: indexPath.row)?.title()

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
        
        guard let row = Row(rawValue: indexPath.row) else {
            return
        }
        
        switch row {
        case .contactUs:
            guard MFMailComposeViewController.canSendMail() else {
                print("can't send mail")
                return
            }
            
            let controller = MFMailComposeViewController()
            controller.setSubject("Feed Back")
            controller.setToRecipients(["app@burger.com"])
            controller.setCcRecipients(["support@burger.com","service@burger.com"])
            
            controller.setMessageBody("<h1>Burger App</h1><br><p>version 1.0</p>", isHTML: true)
            
            //you can add UIView's screenshot
            //controller.addAttachmentData(<#T##attachment: Data##Data#>, mimeType: <#T##String#>, fileName: <#T##String#>)
            
            controller.mailComposeDelegate = self
            
            menuContainerViewController.present(controller, animated: true, completion: nil)
            
            
        default:
            //show relevant tab-bar index
            let tabBarController = menuContainerViewController.centerViewController as? UITabBarController
            tabBarController?.selectedIndex = row.rawValue
            menuContainerViewController.toggleLeftSideMenuCompletion(nil)
        }
    }
    

}

extension MenuTableViewController : MFMailComposeViewControllerDelegate{
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        print(result)
        controller.dismiss(animated: true, completion: nil)
    }
}















