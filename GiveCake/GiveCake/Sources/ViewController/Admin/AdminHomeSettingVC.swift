//
//  AdminHomeSettingVC.swift
//  GiveCake
//
//  Created by YOON CHANG HYO on 2022/07/29.
//

import UIKit

class AdminHomeSettingVC: UIViewController {
    
    @IBOutlet weak var controlBar: UIView!
    @IBOutlet weak var currentCakeCountBox: UIView!
    @IBOutlet weak var totalCakeCountBox: UIView!
    @IBOutlet weak var currentField: UITextField!
    @IBOutlet weak var totalField: UITextField!
    @IBOutlet weak var setBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UIVIew 모서리 값들
        controlBar.layer.cornerRadius = 2
        currentCakeCountBox.layer.cornerRadius = 15
        totalCakeCountBox.layer.cornerRadius = 15
        setBtn.addTarget(self, action: #selector(onClickedSetBtn(sender:)), for: .touchUpInside)
    }
    
    @objc func onClickedSetBtn(sender: UIButton) {
        self.dismiss(animated: true)
        print(currentField.text ?? "none")
        print(totalField.text ?? "none")
    }
    
}


