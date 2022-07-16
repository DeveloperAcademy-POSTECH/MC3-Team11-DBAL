//
//  GlobalConstants.swift
//  GiveCake
//
//  Created by 김동락 on 2022/07/16.
//

import UIKit

enum GlobalConstants {
    static let leftMargin: CGFloat = 20
    
    static let toDayCardRowH: CGFloat = 440
    static let toDayCardCornerRadius: CGFloat = 15.0
    static let todayCardSize: CGSize = CGSize(width: kScreenW - 2 * 20, height: 410)
 
    static let cardDetailTopImageH: CGFloat = 500
    
    static let iconBorderColor: CGColor = UIColor(red: 239/255.0, green: 240/255.0, blue: 241/255.0, alpha: 1).cgColor
    static let iconBorderWidth: CGFloat = 0.8
    static let iconCornerRadius: CGFloat = 17.5
    
    static let textBlueColor = UIColor(red: 0/255.0, green: 122/255.0, blue: 255/255.0, alpha: 1.0)   //007AFF
    static let speratorLineColor = UIColor(red: 224/255.0, green: 224/255.0, blue: 224/255.0, alpha: 1)
    
    //GameTableViewController
    static let recommandHeight: CGFloat = 336
    static let topicHeight: CGFloat = 282
    static let linkHeight: CGFloat = 312
    static let sectionHeaderH: CGFloat = 42
    static let linkCellHeight: CGFloat = 45
    
    //DetailViewController
    static let detailPreviewImageH: CGFloat = 155
    
    //DownloadViewController
    static let doubleClickViewW: CGFloat = 140
    static let clickBarWidth: CGFloat = 6
}


let kScreenH = UIScreen.main.bounds.size.height
let kScreenW = UIScreen.main.bounds.size.width
let navigationBarH: CGFloat = 44


