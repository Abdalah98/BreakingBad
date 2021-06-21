//
//  RandomQoute.swift
//  Breaking Bad
//
//  Created by Abdallah on 6/15/21.
//

import Foundation

// MARK: - RandomQouteElement

struct RandomQouteData: Codable {
    var quoteId: Int?
    var quote, author, series: String?

    enum CodingKeys: String, CodingKey {
           case quoteId = "quote_id"
           case quote = "quote"
           case author = "author"
           case series = "series"
       }
}
