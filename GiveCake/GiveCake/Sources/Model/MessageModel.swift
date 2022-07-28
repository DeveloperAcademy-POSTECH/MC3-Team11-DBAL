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

class MessageModel {
    static var instance = MessageModel()
    
    var takerMessageList: [Message] = [
        Message(
            emoticon: "😘",
            sender: "한스12",
            content: "가나다라마바사가나다라마바사"
        ),
        Message(
            emoticon: "🥸",
            sender: "그라운드23",
            content: "가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사"
        ),
        Message(
            emoticon: "🥸",
            sender: "가나다34",
            content: "가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마"
        )
    ]
    
    var giverMessasgeList: [Message] = [
        Message(
            emoticon: "😘",
            sender: "러브",
            content: "축하해주셔서 감사합니다."
        ),
        Message(
            emoticon: "🥸",
            sender: "러브",
            content: "축하 감사 기쁨 행복 케익 맛있음"
        ),
        Message(
            emoticon: "🥸",
            sender: "러브",
            content: "가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마"
        )
    ]
}
