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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.senderId = FIRAuth.auth()?.currentUser?.uid
        self.senderDisplayName = FIRAuth.auth()?.currentUser?.displayName
        
        // No avatars
        collectionView!.collectionViewLayout.incomingAvatarViewSize = CGSize.zero
        collectionView!.collectionViewLayout.outgoingAvatarViewSize = CGSize.zero
        
        let msg1 = JSQMessage(senderId: "foo", displayName: "foo", text: "Hi There")
        let msg2 = JSQMessage(senderId: self.senderId, displayName: self.senderDisplayName, text: "Who is it?")
        messages += [msg1!,msg2!]
        
        self.finishReceivingMessage()
    }
    
    //MARK: - Send
    
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        
        if let msg = JSQMessage(senderId: self.senderId, displayName: self.senderDisplayName, text: text){
            messages.append(msg)
            self.finishSendingMessage()
            
            JSQSystemSoundPlayer.jsq_playMessageSentSound()
        }
        
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
    
    //MARK: - Bubble
    lazy var outgoingBubbleImageView: JSQMessagesBubbleImage = self.setupOutgoingBubble()
    lazy var incomingBubbleImageView: JSQMessagesBubbleImage = self.setupIncomingBubble()

    private func setupOutgoingBubble() -> JSQMessagesBubbleImage {
        let bubbleImageFactory = JSQMessagesBubbleImageFactory()
        return bubbleImageFactory!.outgoingMessagesBubbleImage(with: UIColor.jsq_messageBubbleBlue())
    }
    
    private func setupIncomingBubble() -> JSQMessagesBubbleImage {
        let bubbleImageFactory = JSQMessagesBubbleImageFactory()
        return bubbleImageFactory!.incomingMessagesBubbleImage(with: UIColor.jsq_messageBubbleRed())
    }
    
    
    

}
