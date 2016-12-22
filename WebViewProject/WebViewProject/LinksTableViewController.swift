//
//  LinksTableViewController.swift
//  WebViewProject
//
//  Created by Benny Davidovitz on 22/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class LinksTableViewController: UITableViewController {

    enum Row : Int{
        case yad2Nadlan
        case yad2Car
        case ynet
        case drushim
        case google
        
        static let count = 5
        
        func title() -> String{
            switch self {
            case .yad2Nadlan: return "יד 2 נדלן"
            case .yad2Car: return "יד 2 רכב"
            case .ynet: return "שמאלנים"
            case .drushim: return "מובטלים"
            case .google: return "לאשתי יש שאלה"
            }
        }
        
        func image() ->  UIImage?{
            switch self {
            case .drushim: return #imageLiteral(resourceName: "work")
            case .google: return #imageLiteral(resourceName: "google_logo")
            case .yad2Car: return #imageLiteral(resourceName: "car")
            case .yad2Nadlan: return #imageLiteral(resourceName: "real_estate")
            case .ynet: return #imageLiteral(resourceName: "news")
            }
        }
        
        func urlString() -> String{
            switch self  {
            case .yad2Nadlan: return "https://m.yad2.co.il/search/2/1"
            case .yad2Car: return "https://m.yad2.co.il/search/1/1"
            case .ynet: return "https://m.ynet.co.il/"
            case .drushim: return "https://www.drushim.co.il"
            case .google: return "https://www.google.com"
            }
        }
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Row.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        let row = Row(rawValue: indexPath.row)
        cell.textLabel?.text = row?.title()
        cell.imageView?.image = row?.image()

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextVC = segue.destination as? WebViewController,
            let cell = sender as? UITableViewCell,
        let indexPath = self.tableView.indexPath(for: cell),
        let row = Row(rawValue: indexPath.row) else {
            return
        }
        
        let urlString = row.urlString()
        guard let url = URL(string: urlString) else {
            return
        }
        
        let request = URLRequest(url: url)
        nextVC.request = request
    }

}












