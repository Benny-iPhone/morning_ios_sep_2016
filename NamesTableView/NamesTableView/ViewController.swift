//
//  ViewController.swift
//  NamesTableView
//
//  Created by Benny Davidovitz on 17/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var namesTableView: UITableView!
    
    //MARK: - Data
    
    var tableArray : [String] = [
        "String 1","String 2"
    ]
    
    func add(name : String?){
        //make sure name is not nil nor empty
        guard let name = name, !name.isEmpty else {
            return
        }
        
        //insert to end of array
        let indexPath = IndexPath(row: tableArray.count, section: 0)
        tableArray.append(name)
        
        //insert in start of array
        /*
        tableArray.insert(name, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
         */
        
        namesTableView.insertRows(at: [indexPath], with: .right)

    }
    
    
    //MARK: - IBAction
    
    @IBAction func addAction(_ sender: Any) {
        
        let controller = UIAlertController(title: "", message: nil, preferredStyle: .alert)
        
        controller.addTextField {
            $0.placeholder = "type new name"
        }
        
        controller.addAction(UIAlertAction(title: "ok", style: .default, handler: { _ in
            self.add(name: controller.textFields?.first?.text)
        }))
        
        present(controller, animated: true, completion: nil)
        
    }
    
    
    //MARK: - UITableView Data Source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tableArray[indexPath.row]
        
        return cell
        
    }
    
    //MARK: - UITableView Delegate
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else {
            return
        }
        
        tableArray.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
    }
}















