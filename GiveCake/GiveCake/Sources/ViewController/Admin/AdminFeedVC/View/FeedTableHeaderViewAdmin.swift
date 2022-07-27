//
//  FeedTableHeaderViewAdmin.swift
//  GiveCake
//
//  Created by seojeon22 on 2022/07/27.
//

import UIKit

class FeedTableHeaderViewAdmin: UIView {

    let todayLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 텍스트 라벨 세팅
    private func setupUI() {
        let screenWidth = UIScreen.main.bounds.width
        todayLabel.text = "모아보기"
        todayLabel.font = UIFont.boldSystemFont(ofSize: 17)
        todayLabel.textAlignment = .center
        todayLabel.frame = CGRect(x: screenWidth/2 - 31.5, y: 48, width: 63, height: 20)

        addSubview(todayLabel)
    }
}

