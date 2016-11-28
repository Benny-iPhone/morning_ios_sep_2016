//
//  ViewController.swift
//  HitList
//
//  Created by Benny Davidovitz on 24/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate{

    let controller : NSFetchedResultsController<Person>
    
    @IBOutlet weak var listTableView: UITableView!
    
    required init?(coder aDecoder: NSCoder) {
        
        let request : NSFetchRequest<Person> = Person.fetchRequest()
        request.sortDescriptors = [
            NSSortDescriptor(key: "last_name", ascending: true),
            NSSortDescriptor(key: "first_name", ascending: true)
        ]
        
        let context = DBManager.manager.persistentContainer.viewContext
        controller = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        super.init(coder: aDecoder)
        
        controller.delegate = self
        try? controller.performFetch()
    }
    
    //MARK: - UITableView Data Source -

    func numberOfSections(in tableView: UITableView) -> Int {
        return controller.sections?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = controller.sections![section]
        return sectionInfo.numberOfObjects
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let obj : Person = controller.object(at: indexPath)
        cell.textLabel?.text = obj.first_name
        cell.detailTextLabel?.text = obj.last_name
        
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
        
        //remove from db
        let person = controller.object(at: indexPath)
        person.dbDelete()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    //MARK: - NSFetchedResultsController Delegate -
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        listTableView.beginUpdates()
    }
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        listTableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        
        let indexSet = IndexSet(integer: sectionIndex)
        
        switch type {
        case .insert:
            listTableView.insertSections(indexSet, with: .automatic)
        case .delete:
            listTableView.deleteSections(indexSet, with: .automatic)
        default:
            return
        }
        
    }
    
    func controller(_ _controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .insert:
            listTableView.insertRows(at: [newIndexPath!], with: .automatic)
        case .delete:
            listTableView.deleteRows(at: [indexPath!], with: .automatic)
        case .update:
            //make flicker when using images
            //listTableView.reloadRows(at: [indexPath!], with: .automatic)
            
            let cell = listTableView.cellForRow(at: indexPath!)
            let person = controller.object(at: indexPath!)
            cell?.textLabel?.text = person.first_name
            cell?.detailTextLabel?.text = person.last_name
 
        default:
            return
        }
        
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPath = listTableView.indexPathForSelectedRow,
            let nextVC = segue.destination as? PersonViewController,
            segue.identifier == "update_segue" {
            //pass person object to PersonViewController
            let p = controller.object(at: indexPath)
            nextVC.person = p
            
            
        }
        
        
    }
    
}




















