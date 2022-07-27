//
//  GiverHomeCompleteVC.swift
//  GiveCake
//
//  Created by YOON CHANG HYO on 2022/07/27.
//

import UIKit

class GiverHomeCompleteVC: UIViewController {
    
    @IBOutlet weak var completeGageView: UIView!
    @IBOutlet weak var countKidsView: UIView!
    
    
    override func viewDidLoad(){
        
        countKidsView.layer.cornerRadius = 20
        completeGageView.layer.cornerRadius = 25
        
    }
}
    
