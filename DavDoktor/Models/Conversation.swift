//
//  Conversation.swift
//  DavDoktor
//
//  Created by Thomas Thisgaard Steffensen on 09/08/2020.
//  Copyright © 2020 Thomas Thisgaard Steffensen. All rights reserved.
//

import Foundation

class Conversation: Decodable {
    let id: String
    let title: String
    var messages: Array<Message> = Array<Message>()
    var status: Int = ConversationStatus.active.rawValue
    
    init(id:String, title:String) {
        self.id = id
        self.title = title
    }
    
    func addMessage(message:Message) {
        messages.append(message)
    }
    
    func closeConversation() {
        status = ConversationStatus.closed.rawValue;
    }
}

enum ConversationStatus: Int {
    case active
    case closed
}
