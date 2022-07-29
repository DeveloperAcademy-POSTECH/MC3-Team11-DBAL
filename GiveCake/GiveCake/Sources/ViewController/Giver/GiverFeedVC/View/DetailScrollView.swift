//
//  DetailScrollView.swift
//  GiveCake
//
//  Created by 김동락 on 2022/07/16.
//

import UIKit

class DetailScrollView: UIScrollView {
    
    let bgBackView = UIView()
    let imageView = UIImageView()
    let textView = VerticalAlignLabel()
    let descriptionView = UIView()
    let stackView = UIStackView()
    let titleView = UILabel()
    let subTitleView = UILabel()
    let dayView = UILabel()
    
    let selectedIdx: Int
    
    fileprivate let textViewLeftMargin: CGFloat = 20
    fileprivate let textViewTopMargin: CGFloat = 40
    fileprivate let textViewBottomMargin: CGFloat = 50
    
    init(frame: CGRect, selectedIdx: Int) {
        self.selectedIdx = selectedIdx
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 상세보기 화면의 상세한 부분 세팅
    private func setupUI() {
        
        stackView.addArrangedSubview(titleView)
        stackView.addArrangedSubview(subTitleView)
        descriptionView.addSubview(stackView)
        descriptionView.addSubview(dayView)
        bgBackView.addSubview(imageView)
        bgBackView.addSubview(descriptionView)
        addSubview(bgBackView)
        addSubview(textView)
        
        bgBackView.frame = CGRect(x: 0, y: 0, width: kScreenW, height: GlobalConstants.feedCardDetailImageHeight)
        bgBackView.layer.masksToBounds = true
        
        imageView.frame = bgBackView.bounds
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFill
        
        descriptionView.backgroundColor = .black.withAlphaComponent(0.5)
        descriptionView.frame = CGRect(
            x: 0,
            y: GlobalConstants.feedCardDetailImageHeight - GlobalConstants.feedCardTitleHeight,
            width: kScreenW,
            height: GlobalConstants.feedCardTitleHeight
        )
        descriptionView.layer.masksToBounds = true
        
        dayView.text = FeedModel.instance.feedList[selectedIdx].day
        dayView.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        dayView.textColor = .white
        dayView.frame = CGRect(
            x: kScreenW - (dayView.intrinsicContentSize.width + GlobalConstants.titlePaddingRight),
            y: descriptionView.bounds.height -       (dayView.intrinsicContentSize.height +           GlobalConstants.titlePaddingBottom),
            width: 0,
            height: 0
        )
        dayView.sizeToFit()
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = GlobalConstants.titlePaddingBetween
        stackView.frame = CGRect(
            x: GlobalConstants.titlePaddingLeft,
            y: GlobalConstants.titlePaddingTop,
            width: GlobalConstants.feedCardSize.width - (GlobalConstants.titlePaddingLeft+GlobalConstants.titlePaddingRight + 50),
            height: descriptionView.bounds.height - (GlobalConstants.titlePaddingTop+GlobalConstants.titlePaddingBottom)
        )
        
        titleView.text = FeedModel.instance.feedList[selectedIdx].title
        titleView.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        titleView.textColor = .white

        subTitleView.text = FeedModel.instance.feedList[selectedIdx].subTitle
        subTitleView.numberOfLines = 0
        subTitleView.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        subTitleView.textColor = .white
         
        var height:CGFloat = 0
        if textView.intrinsicContentSize.height < kScreenH - GlobalConstants.feedCardDetailImageHeight {
            height = kScreenH - bgBackView.frame.height
        } else {
            height = textView.intrinsicContentSize.height + textViewBottomMargin
        }
        textView.frame = CGRect(
            x: textViewLeftMargin,
            y: bgBackView.frame.height + textViewTopMargin,
            width: kScreenW - 2 * textViewLeftMargin,
            height: height
        )
        textView.numberOfLines = 0
        textView.text = FeedModel.instance.feedList[selectedIdx].content
        textView.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        textView.textColor = UIColor(rgb: 0x8E8E93)

        contentSize = CGSize(width: kScreenW, height: bgBackView.frame.height + textViewTopMargin + textView.frame.height + textViewBottomMargin)
    }

}
