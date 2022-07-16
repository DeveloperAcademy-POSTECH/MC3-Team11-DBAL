//
//  GiverLoginVC.swift
//  GiveCake
//
//  Created by 김동락 on 2022/07/14.
//

import UIKit

class GiverLoginVC: UIViewController {
    
    // 스토리보드에서 버튼 객체 가져옴
    @IBOutlet weak var toTabBarBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 버튼에 함수 연결
        toTabBarBtn.addTarget(self, action: #selector(onClickedToTabBarBtn(sender:)), for: .touchUpInside)
    }
    
    // tabbar 화면으로 이동
    @objc func onClickedToTabBarBtn(sender: UIButton) {
        //        performSegue(withIdentifier: "loginToGiverTabBarSegue", sender: nil)
        let storyboard = UIStoryboard(name: "GiverTabBar", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "GiverTabBarVC") as! GiverTabBarVC
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
    
}
