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
    let textView = UITextView()
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
    // TODO: 하이파이처럼 상세보기 화면 구성요소 추가하기
    private func setupUI() {
        bgBackView.frame = CGRect(x: 0, y: 0, width: kScreenW, height: GlobalConstants.feedCardDetailImageHeight)
        bgBackView.layer.masksToBounds = true
        
        imageView.frame = bgBackView.bounds
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFill
        
        let textViewText = GiverFeedModel.instance.feedList[selectedIdx].content
        let textViewWidth = kScreenW - 2 * textViewLeftMargin
        let font = UIFont.boldSystemFont(ofSize: 15)
        let textHeight = textViewText.calculateHeightWith(width: textViewWidth, font: font)
        textView.frame = CGRect(x: textViewLeftMargin, y: bgBackView.frame.height + textViewTopMargin, width: textViewWidth, height: textHeight + textViewBottomMargin)
        textView.text = textViewText
        textView.font = font
        textView.textColor = .gray
        
        bgBackView.addSubview(imageView)
        addSubview(bgBackView)
        addSubview(textView)
    
        contentSize = CGSize(width: kScreenW, height: bgBackView.frame.height + textViewTopMargin + textView.frame.height + textViewBottomMargin)
    }

}
