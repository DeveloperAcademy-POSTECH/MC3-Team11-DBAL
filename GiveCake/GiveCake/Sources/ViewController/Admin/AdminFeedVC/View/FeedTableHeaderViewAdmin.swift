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
        todayLabel.text = "모아보기"
        todayLabel.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        todayLabel.textAlignment = .left
        todayLabel.frame = CGRect(x: 30, y: 41, width: 118, height: 41)

        addSubview(todayLabel)
    }
}

