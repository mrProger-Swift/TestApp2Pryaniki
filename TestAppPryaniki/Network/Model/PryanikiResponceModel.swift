//
//  PryanikiResponceModel.swift
//  TestAppPryaniki
//
//  Created by User on 11.03.2021.
//

import Foundation
struct PryanikiResponceModel: Decodable {
    let data: [Sample]
    let view: [String]
}

struct Sample: Decodable {
    let name: String
    let data: Data
}

struct Data: Decodable {
    var text: String?
    var url: String?
    var selectedId: Int?
    var variants: [Variant]?
}

struct Variant: Decodable {
    var id: Int
    var text: String
}
