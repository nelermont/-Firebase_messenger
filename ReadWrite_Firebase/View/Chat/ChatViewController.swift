//
//  ChatViewController.swift
//  ReadWrite_Firebase
//
//  Created by Дмитрий Подольский on 04.06.2022.
//

import UIKit
import MessageKit
import InputBarAccessoryView

struct Sender: SenderType {
    var senderId: String
    var displayName: String
}

struct Message: MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}

class ChatViewController: MessagesViewController {

    var chatID: String?
    var otherID: String?
    let service = Service.shared
    let selfSender = Sender(senderId: "1", displayName: "Dima")
    let otherSender = Sender(senderId: "2", displayName: "Jony")
    
    var messages = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messages.append(Message(sender: selfSender, messageId: "1", sentDate: Date().addingTimeInterval(-11200), kind: .text("Hello, Jony!")))
        
        messages.append(Message(sender: otherSender, messageId: "2", sentDate: Date().addingTimeInterval(-10200), kind: .text("Hello, Dima!")))
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messageInputBar.delegate = self
        showMessageTimestampOnSwipeLeft = true
    }

    
}

extension ChatViewController: MessagesDisplayDelegate, MessagesLayoutDelegate, MessagesDataSource {
    
    func currentSender() -> SenderType {
        return selfSender
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    
}
extension ChatViewController: InputBarAccessoryViewDelegate {
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        
        let msg =  Message(sender: selfSender, messageId: "1", sentDate: Date(), kind: .text(text))
        messages.append(msg)
        service.sendMessage(otherId: self.otherID, convId: self.chatID, message: msg, text: text) { [weak self] isSend in
            DispatchQueue.main.async {
                inputBar.inputTextView.text = nil
                self?.messagesCollectionView.reloadDataAndKeepOffset()
            }
        }
    }
}
