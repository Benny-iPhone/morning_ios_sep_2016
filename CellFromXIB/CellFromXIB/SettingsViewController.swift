//
//  SettingsViewController.swift
//  CellFromXIB
//
//  Created by Benny Davidovitz on 24/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController , UITableViewDataSource, SettingsTableViewCellDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
//        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        
        //introduction between tableView and cell from nib
        tableView.register(SettingsTableViewCell.nib(), forCellReuseIdentifier: SettingsTableViewCell.reuseIndntifier())
    }
    
    //MARK: - UITableView Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingsTableViewCell.Row.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = SettingsTableViewCell.reuseIndntifier()
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! SettingsTableViewCell
        
        let row = SettingsTableViewCell.Row(rawValue: indexPath.row)!
        cell.configure(row, info: false)
        cell.delegate = self
        
        return cell
        
    }
    
    //MARK: - SettingsTableViewCell Delegate
    func settingsTableViewCell(_ cell: SettingsTableViewCell, didChangeState state: Bool) {
        print(state)
    }

}









