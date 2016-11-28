//
//  PersonExt.swift
//  HitList
//
//  Created by Benny Davidovitz on 24/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension Person{
    convenience init(){
        //Person(context: <#T##NSManagedObjectContext#>)
        self.init(context: DBManager.manager.context)
    }
    
    var image : UIImage?{
        get{
            if let fileName = image_file_name{
                return ImageManager.manager.getImage(by: fileName)
            } else {
                return nil
            }
        }
        set (newImage){
            if let oldName = image_file_name{
                //remove old
                ImageManager.manager.deleteImage(by: oldName)
            }
            
            if let image = newImage{
                //write file and save
                self.image_file_name = ImageManager.manager.save(image: image)
            } else {
                self.image_file_name = nil
            }
        }
    }
    
    func dbDelete(){
        let manager = DBManager.manager
        manager.context.delete(self)
        manager.saveContext()
    }
}
















