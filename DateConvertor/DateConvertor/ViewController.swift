//
//  ViewController.swift
//  DateConvertor
//
//  Created by Benny Davidovitz on 22/09/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum Mode : Int {
        case gregToHeb = 0
        case hebToGreg
        
        func sourceCalendar() -> Calendar{
            switch self {
            case .hebToGreg:
                //NSCalendar(identifier: NSCalendarIdentifierHebrew)!
                return Calendar(identifier: .hebrew)
            case .gregToHeb:
                return Calendar(identifier: .gregorian)
            }
        }
        
        func destinationCalendar() -> Calendar{
            switch self {
            case .gregToHeb:
                //NSCalendar(identifier: NSCalendarIdentifierHebrew)!
                return Calendar(identifier: .hebrew)
            case .hebToGreg:
                return Calendar(identifier: .gregorian)
            }
        }
    }
    var mode : Mode = .gregToHeb
    
    @IBOutlet weak var datePicker : UIDatePicker!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        datePickerValueChangedAction(datePicker)
    }
    
    
    @IBAction func modeSegmentedControlValueChangedAction(_ sender: UISegmentedControl) {
        
        //update mode
        let index = sender.selectedSegmentIndex //current value can by 0 or 1
        //cretae new Mode(enum) value from selected index
        self.mode = Mode(rawValue: index)!
        
        //update date-picker's calendar
        datePicker.calendar = mode.sourceCalendar()
        
        //update label by triggering datePickerValueChangedAction
        datePickerValueChangedAction(datePicker)
    }

    @IBAction func datePickerValueChangedAction(_ sender: UIDatePicker) {
        
        let dateFormatter = DateFormatter() //NSDateFormatter
        dateFormatter.calendar = mode.destinationCalendar()
        
        dateFormatter.dateStyle = .full
                                //.FullStyle
        
        dateFormatter.locale = Locale(identifier: "he")
        //            = NSLocal   e(localeIdentifier: "he")
        
        label.text = dateFormatter.string(from: sender.date)
        //dateFormatter.stringFromDate(sender.date)
        
    }
    


}












