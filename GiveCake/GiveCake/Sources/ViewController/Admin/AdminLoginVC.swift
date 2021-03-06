//
//  AdminLoginVC.swift
//  GiveCake
//
//  Created by 김동락 on 2022/07/25.
//

import UIKit

class AdminLoginVC: UIViewController {
    // 스토리보드에서 버튼 객체 가져옴
    @IBOutlet weak var adminNameTextField: UITextField!
    @IBOutlet weak var toTabBarBtn: UIButton!
    @IBOutlet weak var disableBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.adminNameTextField.addAction(UIAction(handler: self.textHandler), for: .editingChanged)
        // 키보드 바로 띄워주기
        self.adminNameTextField.becomeFirstResponder()
        // 네비게이션바 숨기기
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        // 버튼에 함수 연결
        toTabBarBtn.addTarget(self, action: #selector(onClickedToTabBarBtn(sender:)), for: .touchUpInside)
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
            self.toTabBarBtn.transform = CGAffineTransform(translationX: 0, y: -keyboardRectangle.height)
            self.disableBtn.transform = CGAffineTransform(translationX: 0, y: -keyboardRectangle.height)
        }
    }
    
    // 키보드 내릴때 버튼도 내려주기
    @objc func keyboardDown() {
        toTabBarBtn.transform = .identity
        disableBtn.transform = .identity
    }
  
    // tabbar 화면으로 이동
    @objc func onClickedToTabBarBtn(sender: UIButton) {
        performSegue(withIdentifier: "loginToAdminTabBarSegue", sender: nil)
    }
    
//    @objc func onClickedToTabBarBtn(sender: UIButton) {
//        let storyboard = UIStoryboard(name: "AdminTabBar", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "AdminTabBarVC") as! AdminTabBarVC
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: true, completion: nil)
//    }
    
    // 텍스트 필드가 비어있을때 버튼을 비활성화
    func textHandler(_ a: UIAction) -> Void {
        if self.adminNameTextField.text?.isEmpty == true {
            self.disableBtn.isHidden = false
            self.toTabBarBtn.isHidden = true
        } else {
            self.toTabBarBtn.isHidden = false
            self.disableBtn.isHidden = true
        }
    }
    
}
