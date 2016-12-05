//
//  BranchesViewController.swift
//  Location
//
//  Created by Benny Davidovitz on 05/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import CoreLocation

class BranchesViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var branchesTableView : UITableView!
    
    var tableArray : [Branch] = AppManager.manager.branches

    override func viewDidLoad() {
        super.viewDidLoad()

        sortArray()
        
        let name = Notification.Name(rawValue: AppManager.kNewLocationNotification)
        NotificationCenter.default.addObserver(self, selector: #selector(BranchesViewController.handle(_:)), name: name, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func handle(_ note : Notification){
        sortArray()
        branchesTableView.reloadData()
    }
    
    func sortArray(){
        guard let userLocation = AppManager.manager.locationManager.location else {
            return
        }
        
        //sort by nearest
        tableArray.sort {
            $0.location.distance(from: userLocation) < $1.location.distance(from: userLocation)
        }
    }

    //MARK: - UITableView Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        let branch = tableArray[indexPath.row]
        //name
        cell.textLabel?.text = branch.name
        //distance, if current location found
        if let userLocation = AppManager.manager.locationManager.location{
            
            let distance = userLocation.distance(from: branch.location) / 1000
            cell.detailTextLabel?.text = String(format: "%.2f km", distance)
            
        } else {
            cell.detailTextLabel?.text = ""
        }
        
        return cell
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let nextVC = segue.destination as? BranchDetailsViewController,
            let indexPath = branchesTableView.indexPathForSelectedRow,
            segue.identifier == "details_segue"
        else {
            return
        }
        
        nextVC.branch = tableArray[indexPath.row]
        
    }
    

}
