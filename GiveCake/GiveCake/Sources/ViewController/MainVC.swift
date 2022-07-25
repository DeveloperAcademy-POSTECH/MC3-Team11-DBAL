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
