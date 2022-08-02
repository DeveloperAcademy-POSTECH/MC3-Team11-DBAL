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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UIVIew 모서리 값들
        controlBar.layer.cornerRadius = 2
        currentCakeCountBox.layer.cornerRadius = 15
        totalCakeCountBox.layer.cornerRadius = 15
        
        
    }
    
}


