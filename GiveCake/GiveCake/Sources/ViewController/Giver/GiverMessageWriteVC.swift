//
//  GiverMessageWriteVC.swift
//  GiveCake
//
//  Created by 이성수 on 2022/07/28.
//

import UIKit

class GiverMessageWriteVC: UIViewController {
    
    var complitionHandler: (()->(Void))?
    
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var placeHolder: UILabel!
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var cakeCountLabel: UILabel!

    override func viewDidLoad() {
        sendBtn.addTarget(self, action: #selector(onClickedSendBtn(sender: )), for: .touchUpInside)
        textField.delegate = self
        
        stepper.addTarget(self, action: #selector(countCake(sender: )), for: .valueChanged)
    }

    
    @objc fileprivate func countCake(sender: UIStepper){
        cakeCountLabel.text = Int(sender.value).description
    }
    @objc fileprivate func onClickedSendBtn(sender: UIButton) {
        complitionHandler?()
        
        if let tempText = cakeCountLabel.text, let tempIntValue = Int(tempText) {
            let newDocument = WrittenByGiver(giverNaverID: FirebaseManager.giverUser, giverNumberOfCake: tempIntValue, messageFromGiverToTaker: textField.text, documentID: UUID().uuidString)
            
            FirebaseManager.instance.uploadDocument(collectionName: "WrittenByGiver", newDocument: newDocument.dictionary)
        }
        
        self.dismiss(animated: true)
    }
}

//수제 placeholder
extension GiverMessageWriteVC: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if textField.text.isEmpty {
            placeHolder.alpha = 1.0
        } else {
            placeHolder.alpha = 0.0
        }
    }
}
