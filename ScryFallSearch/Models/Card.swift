//
//  Card.swift
//  ScryFallSearch
//
//  Created by Max on 20/02/2020.
//  Copyright © 2020 chulkov. All rights reserved.
//

import Foundation

// MARK: - Card
struct Card: Codable {
    let object: String
    let totalCards: Int?
    let hasMore: Bool?
    let nextPage: String?
    let data: [Datum]

    enum CodingKeys: String, CodingKey {
        case object
        case totalCards = "total_cards"
        case hasMore = "has_more"
        case nextPage = "next_page"
        case data
    }
    init?() {
        return nil
    }
}

// MARK: - Datum
struct Datum: Codable {
    let id, oracleID, name, typeLine: String
    let imageUris: ImageUris?

    enum CodingKeys: String, CodingKey {
        case  id, name
        case oracleID = "oracle_id"
        case imageUris = "image_uris"
        case typeLine = "type_line"
    }
}

// MARK: - ImageUris
struct ImageUris: Codable {
    let small, normal, large: URL
    let png: URL
    let artCrop, borderCrop: String

    enum CodingKeys: String, CodingKey {
        case small, normal, large, png
        case artCrop = "art_crop"
        case borderCrop = "border_crop"
    }
}
