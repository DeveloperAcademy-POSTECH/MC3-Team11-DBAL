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

typealias TakerFeedback = (String, CKAsset?)

protocol CloudKitDelegate {
    func checkAllFeedback()
}

class CloudKitManager {
    
    var delegate: CloudKitDelegate!
    static var instance = CloudKitManager()
    var storedFeedback: [TakerFeedback] = []
    
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
            } else {
                print(error)
                print("네트워크 오류 발생...")
            }
        }
    }
    
    func fetchAllFeedback()  {
        var storedFeedbackMessage: [String] = []
        var storedFeedbackPhoto: [CKAsset?] = []
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: TakerRecordType, predicate: predicate)
        let operation = CKQueryOperation(query: query)
        operation.database = publicDatabase
        
        operation.recordMatchedBlock = { recordID, result in
            switch result {
            case .success(let record):
//                storedFeedback.append((record.value(forKey: "message"), record.value(forKey: "photo")))
                
                storedFeedbackMessage.append(record.value(forKey: "message") as! String)
                storedFeedbackPhoto.append(record.value(forKey: "photo") as! CKAsset?)
                print("success", record)
            case .failure(let error):
                print(error)
            }
        }
        
        operation.start()
        
        operation.queryResultBlock = { result in
            print("다끝났다~!!")
            for index in 0..<storedFeedbackMessage.count {
                self.storedFeedback.append ((storedFeedbackMessage[index], storedFeedbackPhoto[index]))
                print(self.storedFeedback)
            }
            self.delegate.checkAllFeedback()
            print("끝났...다?")
        }
        print("메시지만",storedFeedbackMessage)
        
        print("this is me", storedFeedback)

    }
}
