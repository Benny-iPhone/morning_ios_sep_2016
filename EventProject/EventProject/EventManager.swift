//
//  EventManager.swift
//  EventProject
//
//  Created by Benny Davidovitz on 26/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import EventKit

typealias EventManagerCompletion = (Error?) -> Void

class EventManager: NSObject {
    static let manager = EventManager()
    let store : EKEventStore
    
    override init() {
        
        store = EKEventStore()
        
        super.init()
    }
    
    func addEvent(with name : String, startingAt startDate : Date, endingAt endDate : Date? = nil, completion : @escaping EventManagerCompletion){
        
        store.requestAccess(to: .event, completion: {granted, error in
            guard granted else {
                completion(error)
                return
            }
            
            let event = EKEvent(eventStore: self.store)
            event.title = name
            event.startDate = startDate
            event.endDate = endDate ?? startDate.addingTimeInterval(3600) //hour
            event.calendar = self.store.defaultCalendarForNewEvents
            
            do {
                try self.store.save(event, span: .thisEvent)
                DispatchQueue.main.async {
                    completion(nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(error)
                }
            }
        })
        
    }
}




