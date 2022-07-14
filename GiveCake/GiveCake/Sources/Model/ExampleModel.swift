//
//  ExampleModel.swift
//  GiveCake
//
//  Created by 김동락 on 2022/07/14.
//

enum PersonType {
    case buyer, seller
}

struct Person {
    var name: String
    var type: PersonType
    var age: Int
}
