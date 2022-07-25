//
//  TakerMessageModel.swift
//  GiveCake
//
//  Created by 김동락 on 2022/07/25.
//

import SwiftUI

struct Message {
    var emoticon: String
    var sender: String
    var content: String
}

class TakerMessageModel {
    static var instance = TakerMessageModel()
    var messageList: [Message] = [
        Message(
            emoticon: "😘",
            sender: "한스12",
            content: "가나다라마바사가나다라마바사"
        ),
        Message(
            emoticon: "🥸",
            sender: "그라운드23",
            content: "가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사"
        )
    ]
}
