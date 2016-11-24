//
//  ViewController.swift
//  DropDownTableView
//
//  Created by Benny Davidovitz on 21/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var contentTableView : UITableView!
    
    var openSet : Set<Int> = [1,2]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentTableView.register(SectionHeaderView.nib(), forHeaderFooterViewReuseIdentifier: SectionHeaderView.identifier)
    }
    
    //MARK: - IBAction
    
    func tapAction(_ sender: SectionHeaderTapGestureRecognizer) {
        
        let index = sender.sectionIndex

        if openSet.contains(index){
            //open, needs to close
            openSet.remove(index)
        } else {
            //close, needs to open
            openSet.insert(index)
        }
        
        //reload section
        let indexSet = IndexSet(integer: index)
        contentTableView.reloadSections(indexSet, with: .automatic)
        
    }
    //MARK: - UITableView Data Source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 25
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if openSet.contains(section){
            //open
            return section + 1
        } else {
            //close
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "Row \(indexPath.row)"
        
        return cell
    }
   
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: SectionHeaderView.identifier)
        
        let label = header?.viewWithTag(1) as? UILabel
        label?.text = "Section \(section)"
        
        for gesture in header?.gestureRecognizers ?? []{
            header?.removeGestureRecognizer(gesture)
        }
        
        let tapGesture = SectionHeaderTapGestureRecognizer(target: self, action: #selector(ViewController.tapAction(_:)), sectionIndex: section)
            
            //UITapGestureRecognizer(target: self, action: #selector(ViewController.tapAction(_:)))
        header?.addGestureRecognizer(tapGesture)
        
        return header
        
    }
    
    /*
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
 */
}












