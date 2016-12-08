//
//  Utils.swift
//  RestAPIProject
//
//  Created by Benny Davidovitz on 08/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import Foundation

extension String{
    
    func escapedString() -> String?{
        let set = (CharacterSet(charactersIn: "!*'();:@&=+$,/?%#[] ").inverted)
        return self.addingPercentEncoding(withAllowedCharacters: set)
    }
}
