//
//  SearchTableViewController.swift
//  JobInterview
//
//  Created by Benny Davidovitz on 28/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController {
    //searchBar's delegate is self
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
    
    var term : String?
    var tableArray : [Item] = []
    var page : Int = 1
    
    func currentType() -> Item.ItemType?{
        switch typeSegmentedControl.selectedSegmentIndex {
        case 0: return .movie
        case 1: return .series
        case 2: return .episode
        default:
            return nil
        }
    }
    
    func getData(){
        
        if page == 1{
            term = searchBar.text
        }
        
        guard let term = term,
            !term.isEmpty
        else {
            tableArray = []
            tableView.reloadData()
            return
        }
        
        APIManager.manager.omdb(search: term, type: currentType(), page: page, completion: { (arr,err) in
            
            guard let arr = arr else {
                //TODO: - handle error
                return
            }
            
            if self.page == 1{
                //first search
                self.tableArray = arr
            } else {
                //new page results
                self.tableArray += arr
            }
            
            self.tableView.reloadData()
            
            
        })
        
    }
    
    //MARK: - IBAction
    
    @IBAction func segmentedControlAction(_ sender: Any) {
    }

    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
