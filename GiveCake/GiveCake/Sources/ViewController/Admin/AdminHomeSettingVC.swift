//
//  AdminHomeSettingVC.swift
//  GiveCake
//
//  Created by YOON CHANG HYO on 2022/07/29.
//

import UIKit

class AdminHomeSettingVC: UIViewController{
    @IBOutlet var controlBar: UIView!
    @IBOutlet weak var currentCakeCountBox: UIView!
    @IBOutlet weak var totalCakeCountBox: UIView!
    @IBAction func confirmButton(_ sender: Any) {
    }
    @IBAction func currentCakeTextField(_ sender: Any) {
    }
    @IBAction func totalCakeTextField(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        
        controlBar.layer.cornerRadius = 2
        currentCakeCountBox.layer.cornerRadius = 15
        totalCakeCountBox.layer.cornerRadius = 15

    }
    
}
