//
//  FirebaseModel.swift
//  GiveCake
//
//  Created by KimJS on 2022/08/01.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

/// 실패 가능성이 있는 dictionary 형태의 데이터 구조 생성기
protocol DocumentSerialization {
    init?(dictionary: [String: Any])
}

struct PwdOfUser {
    let pwdOfGiver: Int
    let pwdOfTaker: Int
    let pwdOfAdmin: Int
    
    var dictionary: [String: Any] {
        return [
            "pwdOfGiver": pwdOfGiver,
            "pwdOfTaker": pwdOfTaker,
            "pwdOfAdmin": pwdOfAdmin
        ]
    }
}

extension PwdOfUser: DocumentSerialization {
    init?(dictionary: [String: Any]) {
        guard let pwdOfGiver = dictionary["pwdOfGiver"] as? Int,
              let pwdOfTaker = dictionary["pwdOfTaker"] as? Int,
              let pwdOfAdmin = dictionary["pwdOfAdmin"] as? Int
        else {return  nil}
        self.init(pwdOfGiver: pwdOfGiver, pwdOfTaker: pwdOfTaker, pwdOfAdmin: pwdOfAdmin)
    }
}

struct CenterChild {
    let nameOfCenterChild: String
    let birthOfCenterChild: Int
    
    var dictionary: [String: Any] {
        return [
            "nameOfCenterChild": nameOfCenterChild,
            "birthOfCenterChild": birthOfCenterChild
        ]
    }
}

struct TotalNumberOfCake {
    let userNumberOfCake: Int
    let adminNumberOfCake: Int
    
    var dictionary: [String: Any] {
        return [
            "userNumberOfCake": userNumberOfCake,
            "adminNumberOfCake": adminNumberOfCake
        ]
    }
}

struct FeedHistory {
    let photoOfFeed: String
    let titleOfFeed: String
    let subTitleOfFeed: String
    let bodyOfFeed: String
    
    var dictionary: [String: Any] {
        return [
            "photoOfFeed": photoOfFeed,
            "titleOfFeed": titleOfFeed,
            "subTitleOfFeed": subTitleOfFeed,
            "bodyOfFeed": bodyOfFeed
        ]
    }
}

struct WrittenByGiver {
    let giverNaverID: String
    let giverNumberOfCake: Int
    let messageFromGiverToTaker: String
    let documentID: String
    
    var dictionary: [String: Any] {
        return [
            "giverNaverID": giverNaverID,
            "giverNumberOfCake": giverNumberOfCake,
            "messageFromGiverToTaker": messageFromGiverToTaker,
            "documentID": documentID
        ]
    }
}

extension WrittenByGiver: DocumentSerialization {
    init?(dictionary: [String: Any]) {
        guard let giverNaverID = dictionary["giverNaverID"] as? String,
              let giverNumberOfCake = dictionary["giverNumberOfCake"] as? Int,
              let messageFromGiverToTaker = dictionary["messageFromGiverToTaker"] as? String,
              let documentID = dictionary["documentID"] as? String
        else { return nil }
        self.init(giverNaverID: giverNaverID, giverNumberOfCake: giverNumberOfCake, messageFromGiverToTaker: messageFromGiverToTaker, documentID: documentID)
    }
}

struct WrittenByTaker {
    let takerName: String
    let messageFromTakerToGiver: String
    let documentID: String
    
    var dictionary: [String: Any] {
        return [
            "takerName": takerName,
            "messageFromTakerToGiver": messageFromTakerToGiver,
            "documentID": documentID
        ]
    }
}

extension WrittenByTaker: DocumentSerialization {
    init?(dictionary: [String: Any]) {
        guard let takerName = dictionary["takerName"] as? String,
              let messageFromTakerToGiver = dictionary["messageFromTakerToGiver"] as? String,
              let documentID = dictionary["documentID"] as? String
        else {return nil}
        self.init(takerName: takerName, messageFromTakerToGiver: messageFromTakerToGiver, documentID: documentID)
    }
    
}
