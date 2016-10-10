//
//  model.swift
//  SliderSample
//
//  Created by Benny Davidovitz on 06/10/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import Foundation
//http://stackoverflow.com/questions/29179692/how-can-i-convert-from-degrees-to-radians

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi / 180 }
    var radiansToDegrees: Double { return Double(self) * 180 / .pi }
}
extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}











