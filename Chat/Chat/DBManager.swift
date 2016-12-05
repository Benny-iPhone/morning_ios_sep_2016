//
//  DBManager.swift
//  Chat
//
//  Created by Benny Davidovitz on 05/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import Firebase

class DBManager: NSObject {
    static let kNewChatMessageNotification = "new_chat_message"
    
    var rootRef : FIRDatabaseReference!
    private var chatRef : FIRDatabaseReference!
    
    static let manager = DBManager()
    
    override init() {
        super.init()
        
        rootRef = FIRDatabase.database().reference()
        chatRef = rootRef.child("chat")
        
        chatRef.queryLimited(toLast: 5).observe(.childAdded, with: { snapshot in
            
            guard let value = snapshot.value as? [String:Any] else {
                return
            }
            
            guard let chatMessage = ChatMessage(id: snapshot.key, dict: value) else {
                return
            }
            print(value)
            
            let name = Notification.Name(rawValue: DBManager.kNewChatMessageNotification)
            NotificationCenter.default.post(name: name, object: chatMessage)
            
        })
        
        /*
        chatRef.observeSingleEvent(of: .value, with: { snapshot in
            guard let value = snapshot.value as? [String:Any] else{
                return
            }
            
            let keys = Array(value.keys)
            print(keys)
            print(value)
        
        })
        
        chatRef.observe(.childAdded, with: { snapshot in
        
            guard let value = snapshot.value as? [String:Any] else {
                return
            }
            
            print(value)
            
        })
 */
    }
    
    func createChatMessage(with text : String){
        guard let user = FIRAuth.auth()?.currentUser,
        let name = user.displayName
        else {
            return
        }
        
        let msgDict : [String:Any] = [
            "uid":user.uid,
            "uname":name,
            "date":Date().timeIntervalSince1970,
            "text":text
        ]
        
        chatRef.childByAutoId().setValue(msgDict)
        
    }
}














