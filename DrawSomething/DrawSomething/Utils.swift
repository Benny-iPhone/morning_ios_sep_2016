//
//  Utils.swift
//  DrawSomething
//
//  Created by Benny Davidovitz on 27/10/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

//http://stackoverflow.com/questions/30696307/how-to-convert-a-uiview-to-a-image

extension UIImage {
    convenience init(view: UIView) {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: (image?.cgImage)!)
    }
}




