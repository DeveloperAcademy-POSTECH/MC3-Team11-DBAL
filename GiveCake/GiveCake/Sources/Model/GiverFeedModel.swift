//
//  FeedViewModel.swift
//  GiveCake
//
//  Created by 김동락 on 2022/07/16.
//

import SwiftUI

struct Feed {
    var image: UIImage
    var title: String
    var subTitle: String
    var content: String
}

class GiverFeedModel {
    static var instance = GiverFeedModel()
    var feedList: [Feed] = [
        Feed(
            image: UIImage(named: "feed_image1")!,
            title: "제목입니다1~",
            subTitle: "소제목입니다1~",
            content: "내용입니다1~"
        ),
        Feed(
            image: UIImage(named: "feed_image2")!,
            title: "제목입니다2~",
            subTitle: "소제목입니다2~",
            content: "내용입니다2~"
        )
    ]
}
