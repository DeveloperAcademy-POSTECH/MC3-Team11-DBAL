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
    var day: String
    var content: String
}

class GiverFeedModel {
    static var instance = GiverFeedModel()
    var feedList: [Feed] = [
        Feed(
            image: UIImage(named: "feed_ssoo_image")!,
            title: "8월의 케이크",
            subTitle: "아이들이 행복한 세상! 🍰\n늘 함께해주셔서 감사합니다~!",
            day: "2020.8.xx",
            content: """
                    8월의 케이크.
                    여려분들의 소중한 마음들이 우리 아이들에게 잘 전달 되었습니다. 무더운 여름 날씨를 이겨내고 잘 커준 아이들의 생일에 좋은 기억을 남겨주시는 여러분들께 감사의 인산를 드립니다. 언제나 가정에 평안이 있기를 바랍니다.

                    아이들이 행복한 세상! 🍰
                    늘 함께해주셔서 감사합니다~!
                    """
        ),
        Feed(
            image: UIImage(named: "feed_hans_image")!,
            title: "제목입니다2~",
            subTitle: "소제목입니다2~",
            day: "2020.7.xx",
            content: "내용입니다2~"
        )
    ]
}
