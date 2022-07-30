//
//  MainVC.swift
//  GiveCake
//
//  Created by 김동락 on 2022/07/25.
//

import UIKit

class MainVC: UIViewController {
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var enterCodeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continueBtn.addTarget(self, action: #selector(onClickedContinueBtn(sender:)), for: .touchUpInside)
        // 키보드 바로 띄워주기
        self.enterCodeTextField.becomeFirstResponder()
    }
    
    // 키보드 올라오는 동작 인지하는 옵저버 등록
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDown), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // 옵저버 해제
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // 키보드 올라올때 버튼도 올려주기
    @objc func keyboardUp(notification:NSNotification) {
        if let keyboardFrame:NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
           let keyboardRectangle = keyboardFrame.cgRectValue
       
            UIView.animate(
                withDuration: 0.3
                , animations: {
                    self.continueBtn.transform = CGAffineTransform(translationX: 0, y: -keyboardRectangle.height)
                }
            )
        }
    }
    
    // 키보드 내릴때 버튼도 내려주기
    @objc func keyboardDown() {
        continueBtn.transform = .identity
    }
    
    // tabbar 화면으로 이동
    @objc func onClickedContinueBtn(sender: UIButton) {
        let inputCode = enterCodeTextField.text
        switch inputCode {
        case "1":
            performSegue(withIdentifier: "goToGiverLoginSegue", sender: nil)
        case "2":
            performSegue(withIdentifier: "goToTakerLoginSegue", sender: nil)
        case "3":
            performSegue(withIdentifier: "goToAdminLoginSegue", sender: nil)
        default:
            print("제대로 된 코드가 입력되지 않음")
        }
    }
}
