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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 네비게이션바 숨기기
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        // 버튼에 함수 연결
        toTabBarBtn.addTarget(self, action: #selector(onClickedToTabBarBtn(sender:)), for: .touchUpInside)
    }
  
    // tabbar 화면으로 이동
    @objc func onClickedToTabBarBtn(sender: UIButton) {
        performSegue(withIdentifier: "loginToTakerTabBarSegue", sender: nil)
    }
    
}
