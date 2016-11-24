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
        
        let obj = controller.object(at: indexPath)
        cell.textLabel?.text = obj.first_name
        cell.detailTextLabel?.text = obj.last_name
        
        return cell
        
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
        default:
            return
        }
        
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .insert:
            listTableView.insertRows(at: [newIndexPath!], with: .automatic)
        default:
            return
        }
        
    }
    
    
}




















