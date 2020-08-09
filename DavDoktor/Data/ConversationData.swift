//
//  ConversationData.swift
//  DavDoktor
//
//  Created by Thomas Thisgaard Steffensen on 09/08/2020.
//  Copyright © 2020 Thomas Thisgaard Steffensen. All rights reserved.
//

import Foundation

let conversationData = #"""
[
    {
        "id": "1",
        "title": "Udslæt",
        "status": 0,
        "messages": [
            {
                "id": "1",
                "senderId": "1",
                "content": "Jeg har røde knopper på mit knæ. Skal jeg købe noget salve?"
            },
            {
                "id": "2",
                "senderId": "2",
                "content": "Jeg ligger en tid ind til en videokonsultation så kan vi se på det sammen."
            }
        ]
    },
    {
        "id": "2",
        "title": "Brækket ribben",
        "status": 0,
        "messages": [
            {
                "id": "56",
                "senderId": "1",
                "content": "Jeg er bange for at jeg har brækket et ribben, hvad skal jeg gøre?"
            },
            {
                "id": "78",
                "senderId": "2",
                "content": "Det lyder ikke rart. Gør det ondt når du ligger ned?"
            }
        ]
    }
]
"""#
