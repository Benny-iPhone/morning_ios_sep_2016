//
//  ChatViewController.swift
//  Chat
//
//  Created by Benny Davidovitz on 01/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import Firebase
import JSQMessagesViewController

class ChatViewController: JSQMessagesViewController {

    var messages : [JSQMessage] = []
    
    var outgoingBubbleImageView: JSQMessagesBubbleImage!
    var incomingBubbleImageView: JSQMessagesBubbleImage!

    //when created from storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        _ = DBManager.manager
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.senderId = FIRAuth.auth()?.currentUser?.uid
        self.senderDisplayName = FIRAuth.auth()?.currentUser?.displayName
        
        //config bubbles
        let bubbleImageFactory = JSQMessagesBubbleImageFactory()
        outgoingBubbleImageView = bubbleImageFactory!.outgoingMessagesBubbleImage(with: UIColor.jsq_messageBubbleBlue())
        incomingBubbleImageView = bubbleImageFactory!.incomingMessagesBubbleImage(with: UIColor.jsq_messageBubbleRed())
        
        // No avatars
        collectionView!.collectionViewLayout.incomingAvatarViewSize = CGSize.zero
        collectionView!.collectionViewLayout.outgoingAvatarViewSize = CGSize.zero
        
        //simulation
        /*
        let msg1 = JSQMessage(senderId: "foo", displayName: "foo", text: "Hi There")
        let msg2 = JSQMessage(senderId: self.senderId, displayName: self.senderDisplayName, text: "Who is it?")
        messages += [msg1!,msg2!]
        
        self.finishReceivingMessage()
        */
        let name = Notification.Name(rawValue: DBManager.kNewChatMessageNotification)
        NotificationCenter.default.addObserver(self, selector: #selector(ChatViewController.handle(_:)), name: name, object: nil)
    }
    
    //avoid zombie
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func handle(_ note : Notification){
        if let msg = note.object as? ChatMessage{
            messages.append(msg.message())
            self.finishReceivingMessage()
            
            if msg.uid == self.senderId{
                JSQSystemSoundPlayer.jsq_playMessageSentSound()
            } else {
                JSQSystemSoundPlayer.jsq_playMessageReceivedSound()
            }
        }
    }
    
    //MARK: - Send
    
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        
        DBManager.manager.createChatMessage(with: text)
        self.finishSendingMessage()
        
        /*
        if let msg = JSQMessage(senderId: self.senderId, displayName: self.senderDisplayName, text: text){
            messages.append(msg)
            self.finishSendingMessage()
            
            JSQSystemSoundPlayer.jsq_playMessageSentSound()
        }*/
        
    }
    
    override func didPressAccessoryButton(_ sender: UIButton!) {
        
    }
    
    //MARK: - Collection View Support
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        return messages[indexPath.item]
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
        let message = messages[indexPath.item] // 1
        if message.senderId == senderId { // 2
            return outgoingBubbleImageView
        } else { // 3
            return incomingBubbleImageView
        }
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource! {
        return nil
    }
    
    //top label
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, attributedTextForMessageBubbleTopLabelAt indexPath: IndexPath!) -> NSAttributedString! {
        
        let msg = messages[indexPath.item]
        if msg.senderId == self.senderId{
            return NSAttributedString(string: "me")
        } else {
            let name = msg.senderDisplayName
            return NSAttributedString(string: name!)
        }
        
    }

    override func collectionView(_ collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForMessageBubbleTopLabelAt indexPath: IndexPath!) -> CGFloat {
        return 14
    }

}

















