//
//  PersonExt.swift
//  HitList
//
//  Created by Benny Davidovitz on 24/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import Foundation
import CoreData

extension Person{
    convenience init(){
        //Person(context: <#T##NSManagedObjectContext#>)
        self.init(context: DBManager.manager.context)
    }
    
    func dbDelete(){
        let manager = DBManager.manager
        manager.context.delete(self)
        manager.saveContext()
    }
}
















