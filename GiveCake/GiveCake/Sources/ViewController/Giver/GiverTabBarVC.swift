//
//  GiverTabBarVC.swift
//  GiveCake
//
//  Created by 김동락 on 2022/07/14.
//

import UIKit

class GiverTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 탭바 화면에서의 네비게이션바 숨기기
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }


}
