//
//  GiverMessageDummyModel.swift
//  GiveCake
//
//  Created by KimJS on 2022/07/17.
//

import Foundation

struct NameBody {
    var name: String
    var body: String
}

//var sendersOfGiverMessage = ["그라운드17", "도피18", "한스19", "잭20", "쑤21"]
//
//var messagesOfGivers = ["러브야 너의 생일을 축하해",
//                        "러브야 올해도 너의 생일을 축하해",
//                        "어제는 뭐 했니 러브?",
//                        "즐거운 생일 보내길 바란다!",
//                        "너의 앞날에 영원한 축복만이 있길!"
//]
//
//let dataOfMessage = [
//    NameBody(name: "그라운드17", body: "러브야 너의 생일을 축하해"),
//    NameBody(name: "도피18", body: "러브야 올해도 너의 생일을 축하해"),
//    NameBody(name: "한스19", body: "어제는 뭐 했니 러브?"),
//    NameBody(name: "잭20", body: "즐거운 생일 보내길 바란다!"),
//    NameBody(name: "쑤21", body: "너의 앞날에 영원한 축복만이 있길!")
//]

var sendersOfGiverMessage = ["러브", "러브", "러브", "러브", "러브"]
var messageOfGivers = ["케이크 감사합니다", "케이크 정말 잘 먹었어요", "케이크 어디건가요? 너무 맛있어요", "생일 축하해주셔서 감사합니다", "너무 맛있어요!!!"]
let dataOfMessage = [NameBody(name: "러브", body: "케이크 감사합니다"), NameBody(name: "러브", body: "케이크 정말 잘 먹었어요"), NameBody(name: "러브", body: "케이크 어디건가요? 너무 맛있어요"), NameBody(name: "러브", body: "생일 축하해주셔서 감사합니다"), NameBody(name: "러브", body: "너무 맛있어요!!!")]
var receivedMessages: [String] = []