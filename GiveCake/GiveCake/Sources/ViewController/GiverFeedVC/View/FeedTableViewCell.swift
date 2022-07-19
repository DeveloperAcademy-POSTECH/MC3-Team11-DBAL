//
//  TodayTableViewCell.swift
//  GiveCake
//
//  Created by 김동락 on 2022/07/16.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    let bgBackView = UIView()
    let bgImageView = UIImageView()
    let descriptionView = UIView()
    let stackView = UIStackView()
    let titleView = UILabel()
    let subTitleView = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 테이블 셀 세팅
    // TODO: 하이파이처럼 상세보기 화면 구성요소 더 추가해야함
    private func setupUI() {
        
        stackView.addArrangedSubview(titleView)
        stackView.addArrangedSubview(subTitleView)
        descriptionView.addSubview(stackView)
        bgBackView.addSubview(bgImageView)
        bgBackView.addSubview(descriptionView)
        contentView.addSubview(bgBackView)
        
        bgBackView.frame = CGRect(x: 20, y: 0, width: GlobalConstants.feedCardSize.width, height: GlobalConstants.feedCardSize.height)
        bgBackView.layer.shadowColor = UIColor.black.cgColor
        bgBackView.layer.shadowOpacity = 0.4
        bgBackView.layer.shadowOffset = CGSize(width: 0, height: 1)
        
        bgImageView.frame = bgBackView.bounds
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.layer.masksToBounds = true
        bgImageView.layer.cornerRadius = GlobalConstants.feedCardCornerRadius
        
        descriptionView.backgroundColor = .black.withAlphaComponent(0.5)
        descriptionView.frame = CGRect(x: 0, y: GlobalConstants.feedCardSize.height - GlobalConstants.feedCardDetailHeight, width: GlobalConstants.feedCardSize.width, height: GlobalConstants.feedCardDetailHeight)
        descriptionView.layer.masksToBounds = true
        descriptionView.layer.cornerRadius = GlobalConstants.feedCardCornerRadius
        descriptionView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.frame = CGRect(x: 27, y: 12, width: descriptionView.bounds.width - 54, height: descriptionView.bounds.height - 24)
        
        titleView.font = UIFont.boldSystemFont(ofSize: 28)
        titleView.textColor = .white

        subTitleView.numberOfLines = 0
        subTitleView.font = UIFont.systemFont(ofSize: 12)
        subTitleView.textColor = .white
    }
    
}

