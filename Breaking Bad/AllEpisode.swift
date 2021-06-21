//
//  AllEpisode.swift
//  Breaking Bad
//
//  Created by Abdallah on 6/20/21.
//

import Foundation
struct AllEpisode: Codable {
    let episodeId: Int?
    let title: String?
    let season: String?
    let airDate: String?
    let characters: [String]?
    let episode: String?
    let series: String?

    enum CodingKeys: String, CodingKey {
        case episodeId = "episode_id"
        case title = "title"
        case season = "season"
        case airDate = "air_date"
        case characters = "characters"
        case episode = "episode"
        case series = "series"
    }
}
