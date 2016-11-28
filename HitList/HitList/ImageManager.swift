//
//  ImageManager.swift
//  HitList
//
//  Created by Benny Davidovitz on 28/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ImageManager: NSObject {
    static let manager = ImageManager()
    
    let documentsDirPath : String
    
    override init() {
        
        documentsDirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        super.init()
    }
    
    func save(image : UIImage) -> String?{
        let fileName = NSUUID().uuidString + ".jpeg"
        let fullPath = documentsDirPath + "/" + fileName
        let url = URL(fileURLWithPath: fullPath)
        
        print(fullPath)
        
        guard let data = UIImageJPEGRepresentation(image, 0.3)
        else {
            return nil
        }
        
        do {
            try data.write(to: url)
        } catch{
            print(error)
            return nil
        }
        
        return fileName
        
    }
    
    func getImage(by name : String) -> UIImage?{
        let fullPath = documentsDirPath + "/" + name
        return UIImage(contentsOfFile: fullPath)
    }
    
    func deleteImage(by name : String){
        let fullPath = documentsDirPath + "/" + name
        if FileManager.default.fileExists(atPath: fullPath){
            try? FileManager.default.removeItem(atPath: fullPath)
        }
    }
    
}











