//
//  TodayTableHeaderView.swift
//  GiveCake
//
//  Created by 김동락 on 2022/07/16.
//

import UIKit

class TodayTableHeaderView: UIView {

    let todayLabel = UILabel()
    var iconButtonClosure: (()->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        let screenWidth = UIScreen.main.bounds.width
        todayLabel.text = "모아보기"
        todayLabel.font = UIFont.boldSystemFont(ofSize: 17)
        todayLabel.textAlignment = .center
        todayLabel.frame = CGRect(x: screenWidth/2 - 31.5, y: 48, width: 63, height: 20)

        addSubview(todayLabel)
    }
}
