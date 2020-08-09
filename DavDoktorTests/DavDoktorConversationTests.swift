//
//  DavDoktorTests.swift
//  DavDoktorTests
//
//  Created by Thomas Thisgaard Steffensen on 09/08/2020.
//  Copyright © 2020 Thomas Thisgaard Steffensen. All rights reserved.
//

import XCTest
@testable import DavDoktor

class DavDoktorConversationTests: XCTestCase {

    var conversation: Conversation!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        conversation = Conversation(id: "1234", title: "testConversation")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddMessage() throws {
        let message: Message = Message(id: "12", content: "test content")
        conversation.addMessage(message: message)
        
        XCTAssert(conversation.messages.count > 0)
    }
    
    func testCloseConversation() throws {
        conversation.closeConversation()
        
        XCTAssert(conversation.status == ConversationStatus.closed.rawValue)
    }

}
