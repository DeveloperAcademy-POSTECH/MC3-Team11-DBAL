//
//  StringExtension.swift
//  GiveCake
//
//  Created by 김동락 on 2022/07/27.
//

import UIKit

// 쓰실 때는 이렇게 쓰면 됩니다~~
// let stringBefore = "안녕 러브야, 러브를 좋아해. 러브가 축복받았으면 좋겠어. 러브는 행복할거야"
// let stringAfter = stringBefore.changeName(by: "민준")

extension String {
    func changeName(by name: String) -> String {
        var isFinalExist: Bool
        var tempString: String = self
        
        // 종성이 있는지 체크하기 위한 마지막 문자 유니코드 변환
        let lastIndex = name.index(before: name.endIndex)
        let lastCharUnicode = UnicodeScalar(String(name[lastIndex]))?.value
        guard let lastCharUnicode = lastCharUnicode else {return self}
        
        // 한글의 제일 처음과 끝의 범위밖일 경우는 오류
        if (lastCharUnicode < 0xAC00 || lastCharUnicode > 0xD7A3) {
            return self;
        }
        // 종성인지 확인
        let checkedValue = (lastCharUnicode - 0xAC00) % 28
        
        if checkedValue > 0 {
            isFinalExist = true
        } else{
            isFinalExist = false
        }
        
        // 글자 변환하기
        if isFinalExist {
            tempString = tempString.replacingOccurrences(of: "러브를", with: name + "이를")
            tempString = tempString.replacingOccurrences(of: "러브가", with: name + "이가")
            tempString = tempString.replacingOccurrences(of: "러브는", with: name + "이는")
            tempString = tempString.replacingOccurrences(of: "러브야", with: name + "아")
        } else {
            tempString = tempString.replacingOccurrences(of: "러브를", with: name + "를")
            tempString = tempString.replacingOccurrences(of: "러브가", with: name + "가")
            tempString = tempString.replacingOccurrences(of: "러브는", with: name + "는")
            tempString = tempString.replacingOccurrences(of: "러브야", with: name + "야")
        }
        tempString = tempString.replacingOccurrences(of: "러브", with: name)
        
        return tempString
    }
}
