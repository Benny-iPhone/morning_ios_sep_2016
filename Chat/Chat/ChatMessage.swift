//
//  ChatMessage.swift
//  Chat
//
//  Created by Benny Davidovitz on 05/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import JSQMessagesViewController

class ChatMessage: NSObject {
    let id : String
    let uid : String
    let uname : String
    let date : Date
    let text : String?
    
    init?(id : String, dict : [String:Any]) {
        self.id = id
        guard let uid = dict["uid"] as? String,
            let uname = dict["uname"] as? String,
        let timestamp = dict["date"] as? Double
        else {
            return nil
        }
        
        self.uid = uid
        self.uname = uname
        self.date = Date(timeIntervalSince1970: timestamp)
        
        self.text = dict["text"] as? String
        
        
    }
    
    func message() -> JSQMessage{
        return JSQMessage(senderId: uid, displayName: uname, text: text)!
    }
}














