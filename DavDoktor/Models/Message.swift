//
//  Message.swift
//  DavDoktor
//
//  Created by Thomas Thisgaard Steffensen on 09/08/2020.
//  Copyright © 2020 Thomas Thisgaard Steffensen. All rights reserved.
//

import Foundation

struct Message: Decodable {
    let id: String
    let senderId: String
    let content: String
    
    init(id: String, senderId: String, content: String) {
        self.id = id
        self.senderId = senderId
        self.content = content
    }
}
