//
//  FirebaseManager.swift
//  GiveCake
//
//  Created by KimJS on 2022/08/01.
//

import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift


final class FirebaseManager {
    static let instance = FirebaseManager()
    static var giverUser: String = ""
    static var takerUser: String = ""
    /// Firestore database에 접근하기 위한 reference(오직 한 곳을 향해 고정되어 있음)
    private let db = Firestore.firestore()
    /// 접근될때마다 아무런 값도 없는 배열로 설정하기 위해 willSet 이용
    static var writtenByGivers: [WrittenByGiver] = [] {
        willSet { [WrittenByGiver]() }
    }
    /// 접근될때마다 아무런 값도 없는 배열로 설정하기 위해 willSet 이용
    static var writtenByTakers: [WrittenByTaker] = [] {
        willSet { [WrittenByTaker]() }
    }
    /// Firestore database에 접근하기 위한 reference(가변적임)
    private var ref: DocumentReference? = nil
}

extension FirebaseManager {
    
    /// 새로운 document를 서버에 올리는 함수
    func uploadDocument(collectionName: String, newDocument: [String: Any]) {
        ref = db.collection(collectionName).addDocument(data: newDocument
        , completion: { error in
            if let error = error {
                print("업로드 과정 중 error 발생 : \(error)")
            } else {
                print("업로드가 되었습니다! Document의 ID는 \(self.ref!.documentID)")
            }
        })
    }
    
    /// 서버에 올라가 있는 특정 documentID를 가진 document의 특정 field 업데이트
    func updateDocument(collectionName: String, documentID: String, fieldName: String, newData: Any) {
//        var ref: DocumentReference? = nil
        ref = db.collection(collectionName).document(documentID)
        ref?.updateData([
            fieldName: newData
        ]) { err in
            if let err = err {
                print("업데이트 하던 과정 중에 error 발생 : \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
    
    /// 서버에 있는 데이터 로드해와서 배열에다가 전부 다 넣는 함수
    /// 출처 : https://kimcomdong.tistory.com/entry/iOS-다이어리-데이터-FireStore-CRUD-방법-모델-구조-실시간-업데이트하는-법-Timestamp-to-NSDate-타입변경?category=813088
    /// 이 함수를 쓰는 방법
    /// 마지막에 아래의 코드를 붙이기
    /// DispatchQueue.main.async {
    /// self.tableview.reloadData()
    /// 참고 : https://medium.com/quick-code/step-by-step-guide-to-use-firebase-firestore-in-an-ios-app-749c5254a27b
    /// }
    func loadData(collectionName: String, completion: @escaping (Bool, [Any]) -> Void) {
        db.collection(collectionName).getDocuments() { querySnapshot, err in
            if let err = err {
                print("데이터 가져오는 과정 중 error 발생 : \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("현재 가져올려는 documentID: \(document.documentID), 현재 가져올려는 data: \(document.data())")
                    if let stamp = document.data()["documentID"] as? String {
                        switch collectionName {
                        case "WrittenByGiver":
                            FirebaseManager.writtenByGivers.append(WrittenByGiver(giverNaverID: document.data()["giverNaverID"] as! String, giverNumberOfCake: document.data()["giverNumberOfCake"] as! Int, messageFromGiverToTaker: document.data()["messageFromGiverToTaker"] as! String, documentID: document.data()["documentID"] as! String))
                            DispatchQueue.main.async {
                                completion(true, FirebaseManager.writtenByGivers)
                            }
                        case "WrittenByTaker":
                            FirebaseManager.writtenByTakers.append(WrittenByTaker(takerName: document.data()["takerName"] as! String, messageFromTakerToGiver: document.data()["messageFromTakerToGiver"] as! String, documentID: document.data()["documentID"] as! String))
                            DispatchQueue.main.async {
                                completion(true, FirebaseManager.writtenByTakers)
                            }
                        default:
                            print("데이터를 가져오는 과정에서 문제 발생")
                        }
                       
                    }
                }
            }
        }
    }
    
    /// 특정 collection의 특정 documentID를 갖고 있는 document 삭제하기
    func deleteDocument(collectionName: String, documentID: String) {
        db.collection(collectionName).document(documentID).delete(completion: { err in
            if let err = err {
                print("document 삭제 중 error 발생 : \(err)")
            } else {
                print("document 성공적으로 삭제!")
            }
        })
    }
}

