//
//  TakerLoginVC.swift
//  GiveCake
//
//  Created by 김동락 on 2022/07/25.
//

import UIKit

class TakerLoginVC: UIViewController {
    // 스토리보드에서 버튼 객체 가져옴
    @IBOutlet weak var toTabBarBtn: UIButton!
    @IBOutlet weak var childNameTextField: UITextField!
    @IBOutlet weak var disableBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.childNameTextField.addAction(UIAction(handler: self.textHandler), for: .editingChanged)
        // 키보드 바로 띄워주기
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01) {
            self.childNameTextField.becomeFirstResponder()
        }
        // 네비게이션바 숨기기
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        // 버튼에 함수 연결
        toTabBarBtn.addTarget(self, action: #selector(onClickedToTabBarBtn(sender:)), for: .touchUpInside)
    }
    
    // 텍스트 필드가 비어있을때 버튼을 비활성화
    func textHandler(_ a: UIAction) -> Void {
        if self.childNameTextField.text?.isEmpty == true {
            self.disableBtn.isHidden = false
            self.toTabBarBtn.isHidden = true
        } else {
            self.toTabBarBtn.isHidden = false
            self.disableBtn.isHidden = true
        }
    }
  
  
    // tabbar 화면으로 이동
    @objc func onClickedToTabBarBtn(sender: UIButton) {
        performSegue(withIdentifier: "loginToTakerSegue", sender: nil)
    }
    
}
