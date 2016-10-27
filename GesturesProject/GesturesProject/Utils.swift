//
//  Utils.swift
//  GesturesProject
//
//  Created by Benny Davidovitz on 13/10/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import Foundation
import UIKit

//http://stackoverflow.com/questions/1906511/how-to-find-the-distance-between-two-cg-points
extension CGPoint {
    
    func distance(toPoint p:CGPoint) -> CGFloat {
        return sqrt(pow(x - p.x, 2) + pow(y - p.y, 2))
    }
}
