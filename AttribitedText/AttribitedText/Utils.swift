//
//  Utils
//  AttribitedText
//
//  Created by Benny Davidovitz on 31/10/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import Foundation

extension Character{
    
    func isVowel() -> Bool{
        switch self {
        case "a","A","e","E","i","I","o","O","u","U":
            return true
        default:
            return false
        }
    }
    
}
