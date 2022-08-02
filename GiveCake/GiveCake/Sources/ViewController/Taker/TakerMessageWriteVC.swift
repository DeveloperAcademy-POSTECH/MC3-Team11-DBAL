//
//  GiverMessageWriteVC.swift
//  GiveCake
//
//  Created by 김동락 on 2022/07/26.
//

import UIKit

class TakerMessageWriteVC: UIViewController {
    
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var rectangle: UIView!
    @IBOutlet weak var placeHolder: UILabel!
    @IBOutlet weak var textFieldBackground: UIView!
    
    var completionHandler: (() -> (Void))?
    
    override func viewDidLoad() {
        rectangle.layer.cornerRadius = 2
        textFieldBackground.layer.cornerRadius = 7
        textField.delegate = self
        
        // 키보드 바로 띄워주기
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01) {
            self.textField.becomeFirstResponder()
        }
        
        // 버튼 연결하기
        sendBtn.addTarget(self, action: #selector(onClickedSendBtn(sender:)), for: .touchUpInside)
    }
    
    @objc fileprivate func onClickedSendBtn(sender: UIButton) {
        
        let newDocument = WrittenByTaker(takerName: FirebaseManager.takerUser, messageFromTakerToGiver: textField.text, documentID: UUID().uuidString)
        FirebaseManager.instance.uploadDocument(collectionName: "WrittenByTaker", newDocument: newDocument.dictionary)
        completionHandler?()
        self.dismiss(animated: true)
    }
}

extension TakerMessageWriteVC: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if textField.text.isEmpty {
            placeHolder.alpha = 1.0
        } else {
            placeHolder.alpha = 0.0
        }
        
        // TODO: 글자수 제한하는 기능 만들기
    }
}
