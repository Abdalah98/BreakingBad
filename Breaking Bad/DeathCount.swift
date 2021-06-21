//
//  DeathCount.swift
//  Breaking Bad
//
//  Created by Abdallah on 6/16/21.
//

import Foundation
struct DeathCountElement: Codable {
    var deathCount: Int?

    enum CodingKeys: String, CodingKey {
        case deathCount = "deathCount"
    }
}
