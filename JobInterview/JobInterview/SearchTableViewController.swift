//
//  SearchTableViewController.swift
//  JobInterview
//
//  Created by Benny Davidovitz on 28/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import CCBottomRefreshControl
import Toast

class SearchTableViewController: UITableViewController , UISearchBarDelegate, DetailsViewControllerDelegate{
    
    //searchBar's delegate is self
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
    
    var term : String?
    var tableArray : [Item] = []
    var page : Int = 1{
        didSet{
            getData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //top
        self.refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(SearchTableViewController.reloadData), for: .valueChanged)
        //bottom
        tableView.bottomRefreshControl = UIRefreshControl()
        tableView.bottomRefreshControl.addTarget(self, action: #selector(SearchTableViewController.nextPage), for: .valueChanged)
    }
    
    func reloadData(){
        page = 1
    }
    
    func nextPage(){
        page += 1
    }
    
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
        
        func emptyTableView(){
            self.refreshControl?.endRefreshing()
            self.tableView.bottomRefreshControl.endRefreshing()
            self.tableArray = []
            self.tableView.reloadData()
        }
        
        guard let term = term,
            !term.isEmpty
        else {
            emptyTableView()
            return
        }
        
        APIManager.manager.omdb(search: term, type: currentType(), page: page, completion: { (arr,err) in
            
            self.refreshControl?.endRefreshing()
            self.tableView.bottomRefreshControl.endRefreshing()
            
            guard let arr = arr else {
                //TODO: - handle error
                self.view.makeToast(err?.localizedDescription, duration: 10, position: CSToastPositionTop)
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
    
    //MARK: - UISearchBar Delegate
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        page = 1
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        page = 1
        searchBar.resignFirstResponder()
    }
    
    //MARK: - IBAction
    
    @IBAction func segmentedControlAction(_ sender: Any) {
        page = 1
    }

    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = SearchTableViewCell.identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! SearchTableViewCell

        // Configure the cell...
        let item = tableArray[indexPath.row]
        cell.configure(item)

        return cell
    }
    


    
    // MARK: - Navigation
    /*
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
    }*/

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier,
            identifier == "details_segue",
        let indexPath = tableView.indexPathForSelectedRow,
        let nextVC = segue.destination as? DetailsViewController
        
        else {
            return
        }
        
        nextVC.delegate = self
        nextVC.indexPath = indexPath
        nextVC.item = tableArray[indexPath.row]
        
    }
    
    //MARK: - DetailsViewController Delegate
    func detailsVC(_ controller: DetailsViewController, didFetch obj: DetailedItem) {
        //set DetailedItem instead of Item 
        tableArray[controller.indexPath.row] = obj
        
    }
    

}










