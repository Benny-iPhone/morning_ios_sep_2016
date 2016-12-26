//
//  Utils.swift
//  EventProject
//
//  Created by Benny Davidovitz on 26/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import Foundation
import Toast

extension String{
    func toast(at position : Any = CSToastPositionTop){
        
        guard let view = UIApplication.shared.delegate?.window else {
            return
        }
        
        view?.makeToast(self, duration: 2, position: CSToastPositionTop)
        
    }
}
