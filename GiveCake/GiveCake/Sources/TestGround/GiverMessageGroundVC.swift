//
//  GiverMessageGroundVC.swift
//  GiveCake
//
//  Created by KimJS on 2022/07/29.
//

import UIKit
import FirebaseFirestore

class GiverMessageGroundVC: UIViewController {
    
    let db = Firestore.firestore()

    // MARK: Input Giver data
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var numberOfCake: UILabel!
    @IBOutlet weak var cakeStepper: UIStepper!
    
    // MARK: Fetch Taker data
    @IBOutlet weak var nameOfTaker: UILabel!
    @IBOutlet weak var messageOfTaker: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        numberOfCake.text = "1"
    }
    
    @IBAction func uploadGiverData(_ sender: UIButton) {
        // Add a new document with a generated id.
        var ref: DocumentReference? = nil
        ref = db.collection("Giver").addDocument(data: [
            "naverID": nameTextField.text ?? "defaultNaverID",
            "message": messageTextField.text ?? "defaultMessage",
            "numberOfCake": numberOfCake.text ?? 1
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    @IBAction func fetchTakerData(_ sender: UIButton) {
//        db.collection("Taker").getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                for document in querySnapshot!.documents {
//                    nameOfTaker.text = document.("fosterChildName")
//                    messageof
//                    print("\(document.documentID) => \(document.data())")
//                }
//            }
//        }
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        numberOfCake.text = Int(sender.value).description
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
