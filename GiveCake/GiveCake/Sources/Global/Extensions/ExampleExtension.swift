//
//  ExampleExtension.swift
//  GiveCake
//
//  Created by 김동락 on 2022/07/14.
//

import SwiftUI
 
// SwiftUi 에서 hex 코드로 색상을 쓰기 위한 extension
// 참고 사이트 https://seons-dev.tistory.com/entry/CODE-SwiftUI-%EC%BB%AC%EB%9F%AC-%EC%9D%B5%EC%8A%A4%ED%85%90%EC%85%98-%EB%A7%8C%EB%93%A4%EA%B8%B0-%ED%97%A5%EC%8A%A4%EC%BD%94%EB%93%9C%ED%99%9C%EC%9A%A9

extension Color {
  init(hex: String) {
    let scanner = Scanner(string: hex)
    _ = scanner.scanString("#")
    
    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)
    
    let r = Double((rgb >> 16) & 0xFF) / 255.0
    let g = Double((rgb >>  8) & 0xFF) / 255.0
    let b = Double((rgb >>  0) & 0xFF) / 255.0
    self.init(red: r, green: g, blue: b)
  }
}


