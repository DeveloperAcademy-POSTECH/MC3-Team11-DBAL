//
//  CloudKitManager.swift
//  GiveCake
//
//  Created by KimJS on 2022/07/17.
//

import Foundation
import CloudKit

enum FetchError {
    case fetchingError
    case noRecords
    case none
}

struct Establishment {
    let userName: String
    var message: String
    let numberOfCake: Int?
    
    init(userName: String, message: String, numberOfCake: Int) {
        self.userName = userName
        self.message = message
        self.numberOfCake = numberOfCake
    }
}

struct Feedback {
    var message: String
    let photo: CKAsset?
    
    init(message: String, photo: CKAsset) {
        self.message = message
        self.photo = photo
    }
}

struct CloudKitManager {
    
    private let GiverRecordType = "Establishment"
    private let TakerRecordType = "Feedback"
    
    private let publicDatabase = CKContainer(identifier: "iCloud.com.DBAL.GiveCake").publicCloudDatabase
    
    func saveEstablishment(item: Establishment) {
        let record = CKRecord(recordType: GiverRecordType)
        record.setValue(item.userName, forKey: "userName")
        record.setValue(item.message, forKey: "message")
        record.setValue(item.numberOfCake, forKey: "numberOfCake")
        publicDatabase.save(record) { record, error in
            if record != nil, error == nil {
                print("\(item.userName)'s data saved")
            }
        }
    }
}
