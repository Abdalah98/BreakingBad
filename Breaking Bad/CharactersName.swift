//
//  CharactersName.swift
//  Breaking Bad
//
//  Created by Abdallah on 6/16/21.
//

import Foundation
struct CharactersNameElement: Codable {
    let charId: Int?
    let name: String?
    let birthday: String?
    let occupation: [String]?
    let img: String?
    let status: String?
    let nickname: String?
    let appearance: [Int]?
    let portrayed: String?
    let category: String?
    let betterCallSaulAppearance: [Int]?

    enum CodingKeys: String, CodingKey {
        case charId = "char_id"
        case name = "name"
        case birthday = "birthday"
        case occupation = "occupation"
        case img = "img"
        case status = "status"
        case nickname = "nickname"
        case appearance = "appearance"
        case portrayed = "portrayed"
        case category = "category"
        case betterCallSaulAppearance = "better_call_saul_appearance"
    }
    
}
