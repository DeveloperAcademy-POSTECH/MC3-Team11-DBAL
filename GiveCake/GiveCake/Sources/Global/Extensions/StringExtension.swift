//
//  StringExtension.swift
//  GiveCake
//
//  Created by 김동락 on 2022/07/16.
//

import CoreGraphics
import UIKit

extension String {
    // width와 font를 이용해 텍스트뷰의 높이를 계산해줌
    func calculateHeightWith(width: CGFloat, font: UIFont)-> CGFloat {
        let attr = [NSAttributedString.Key.font: font]
        let maxSize: CGSize = CGSize(width: width, height: CGFloat(MAXFLOAT))
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        return self.boundingRect(with: (maxSize), options: option, attributes: attr, context: nil).size.height
    }
}
