//
//  FirebaseStorageManager.swift
//  GiveCake
//
//  Created by KimJS on 2022/08/01.
//

import Foundation
import FirebaseStorage

final class FirebaseStorageManager {
    /// Firebase Storage에 접근하기 위한 reference(오직 한 곳을 향해 고정되어 있음)
    private let storage = Storage.storage()
    /// Firebase Storage에 접근하기 위한 reference(가변적임)
    private var storageRef: StorageReference? = nil
    /// memory에 있는 Data를 가리킨다
    private let data = Data()
}

/// 참고 : https://firebase.google.com/docs/storage/ios/upload-files
extension FirebaseStorageManager {
    
    func uploadPhoto(newPhoto: String, pathToImage: String) {
        let localFile = URL(string: pathToImage)
        storageRef = storage.reference().child(newPhoto)
        storageRef?.putData(data, metadata: nil) { (metadata, error) in
            guard let metadata = metadata else {
                // 오류발생
                return
            }
        }
        storageRef?.putFile(from: localFile!, metadata: nil)
    }
}
