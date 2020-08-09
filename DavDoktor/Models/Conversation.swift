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
    var messages: Array<Message>
    var status: Int
    
    func closeConversation() {
        status = ConversationStatus.closed.rawValue;
    }
}

enum ConversationStatus: Int {
    case active
    case closed
}
