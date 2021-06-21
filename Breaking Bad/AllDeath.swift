//
//  AllDeath.swift
//  Breaking Bad
//
//  Created by Abdallah on 6/16/21.
//

import Foundation
struct AllDeathElement: Codable {
    let deathId: Int?
    let death: String?
    let cause: String?
    let responsible: String?
    let lastWords: String?
    let season: Int?
    let episode: Int?
    let numberOfDeaths: Int?

    enum CodingKeys: String, CodingKey {
        case deathId = "death_id"
        case death = "death"
        case cause = "cause"
        case responsible = "responsible"
        case lastWords = "last_words"
        case season = "season"
        case episode = "episode"
        case numberOfDeaths = "number_of_deaths"
    }
}
