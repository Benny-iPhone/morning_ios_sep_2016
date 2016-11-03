//
//  Utils.swift
//  SpriteSheetAnimationSample
//
//  Created by Benny Davidovitz on 03/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

//inspired from http://stackoverflow.com/questions/2635371/how-to-crop-the-uiimage

extension UIImage{
    
    func crop(rect : CGRect) -> UIImage?{
        if let resultCGImage = self.cgImage?.cropping(to: rect){
            return UIImage(cgImage: resultCGImage)
        } else {
            return nil
        }
    }
    
    func spriteSheetImages(rows : UInt, columns : UInt) -> [UIImage]{
        let singleImageSize = CGSize(
            width: self.size.width / CGFloat(columns),
            height: self.size.height / CGFloat(rows)
        )
        
        var finalArray : [UIImage] = []
        var rect = CGRect(origin: .zero, size: singleImageSize)
        
        for _ in 0..<rows{
            for _ in 0..<columns{
                //crop
                if let img = self.crop(rect: rect){
                    //add to array
                    finalArray.append(img)
                }
                
                //increase x
                rect.origin.x += singleImageSize.width
            }
            
            //increase y
            rect.origin.y += singleImageSize.height
            //set x to 0
            rect.origin.x = 0
            
        }
        
        //finish
        return finalArray
    }
    
}





















