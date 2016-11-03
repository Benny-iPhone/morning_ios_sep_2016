//
//  Locale.swift
//  Localizations
//
//  Created by Benny Davidovitz on 31/10/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import Foundation

enum LocalizedKey : String{
    case key = "key"
    case viewControllerLabel1 = "VIEW_CONTORLLER_LABEL_1"
    case viewControllerLabel2 = "VIEW_CONTROLLER_LABEL_2"
    
    func localizedString() -> String{
        return Bundle.main.localizedString(forKey: self.rawValue, value: self.rawValue, table: nil)
    }
    
}

extension String{
    init(_ key : LocalizedKey) {
        self = key.localizedString()
    }
}


func localizedStringFor(key : String) -> String{
    return Bundle.main.localizedString(forKey: key, value: key, table: nil)
}


















