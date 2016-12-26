//
//  DateTextField.swift
//  EventProject
//
//  Created by Benny Davidovitz on 26/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import FSCalendar

class DateTextField: UITextField , FSCalendarDataSource, FSCalendarDelegate{

    var selectedDate : Date = Date(){
        didSet{
            self.resignFirstResponder()
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            self.text = formatter.string(from: selectedDate)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        var rect = UIScreen.main.bounds
        rect.size.height = 253
        let calendarView = FSCalendar(frame: rect)
        calendarView.backgroundColor = .white
        calendarView.dataSource = self
        calendarView.delegate = self
        
        calendarView.today = Date()
        calendarView.select(selectedDate)
        
        inputView = calendarView
    }

    func calendar(_ calendar: FSCalendar, didSelect date: Date) {
        self.selectedDate = date
    }
}
