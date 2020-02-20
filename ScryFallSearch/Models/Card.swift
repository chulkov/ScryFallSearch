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
    let totalCards: Int
    let hasMore: Bool
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
    let object: DatumObject
    let id, oracleID: String
    let multiverseIDS: [Int]
    let mtgoID, mtgoFoilID, tcgplayerID: Int?
    let name: String
    let lang: Lang
    let releasedAt: String
    let uri, scryfallURI: String
    let layout: Layout
    let highresImage: Bool
    let imageUris: ImageUris?
    let manaCost: String?
    let cmc: Int
    let typeLine: String
    let oracleText: String?
    let colors: [Color]?
    let colorIdentity: [Color]
    let legalities: Legalities
    let games: [Game]
    let reserved, foil, nonfoil, oversized: Bool
    let promo, reprint, variation: Bool
    let datumSet, setName: String
    let setType: SetType
    let setURI, setSearchURI, scryfallSetURI, rulingsURI: String
    let printsSearchURI: String
    let collectorNumber: String
    let digital: Bool
    let rarity: Rarity
    let cardBackID, artist: String
    let artistIDS: [String]
    let illustrationID: String?
    let borderColor: BorderColor
    let frame: String
    let fullArt, textless, booster, storySpotlight: Bool
    let edhrecRank: Int?
    let prices: [String: String?]
    let relatedUris: RelatedUris
    let purchaseUris: PurchaseUris
    let arenaID: Int?
    let flavorText, power, toughness: String?
    let preview: Preview?
    let allParts: [AllPart]?
    let watermark: String?
    let promoTypes: [String]?
    let frameEffects: [FrameEffect]?
    let cardFaces: [CardFace]?

    enum CodingKeys: String, CodingKey {
        case object, id
        case oracleID = "oracle_id"
        case multiverseIDS = "multiverse_ids"
        case mtgoID = "mtgo_id"
        case mtgoFoilID = "mtgo_foil_id"
        case tcgplayerID = "tcgplayer_id"
        case name, lang
        case releasedAt = "released_at"
        case uri
        case scryfallURI = "scryfall_uri"
        case layout
        case highresImage = "highres_image"
        case imageUris = "image_uris"
        case manaCost = "mana_cost"
        case cmc
        case typeLine = "type_line"
        case oracleText = "oracle_text"
        case colors
        case colorIdentity = "color_identity"
        case legalities, games, reserved, foil, nonfoil, oversized, promo, reprint, variation
        case datumSet = "set"
        case setName = "set_name"
        case setType = "set_type"
        case setURI = "set_uri"
        case setSearchURI = "set_search_uri"
        case scryfallSetURI = "scryfall_set_uri"
        case rulingsURI = "rulings_uri"
        case printsSearchURI = "prints_search_uri"
        case collectorNumber = "collector_number"
        case digital, rarity
        case cardBackID = "card_back_id"
        case artist
        case artistIDS = "artist_ids"
        case illustrationID = "illustration_id"
        case borderColor = "border_color"
        case frame
        case fullArt = "full_art"
        case textless, booster
        case storySpotlight = "story_spotlight"
        case edhrecRank = "edhrec_rank"
        case prices
        case relatedUris = "related_uris"
        case purchaseUris = "purchase_uris"
        case arenaID = "arena_id"
        case flavorText = "flavor_text"
        case power, toughness, preview
        case allParts = "all_parts"
        case watermark
        case promoTypes = "promo_types"
        case frameEffects = "frame_effects"
        case cardFaces = "card_faces"
    }
}

// MARK: - AllPart
struct AllPart: Codable {
    let object: AllPartObject
    let id: String
    let component: Component
    let name, typeLine: String
    let uri: String

    enum CodingKeys: String, CodingKey {
        case object, id, component, name
        case typeLine = "type_line"
        case uri
    }
}

enum Component: String, Codable {
    case comboPiece = "combo_piece"
    case token = "token"
}

enum AllPartObject: String, Codable {
    case relatedCard = "related_card"
}

enum BorderColor: String, Codable {
    case black = "black"
    case silver = "silver"
    case white = "white"
}

// MARK: - CardFace
struct CardFace: Codable {
    let object, name, manaCost, typeLine: String
    let oracleText: String
    let power, toughness, flavorText: String?
    let artist, artistID: String
    let illustrationID, watermark: String?
    let colors: [Color]?
    let imageUris: ImageUris?
    let colorIndicator: [Color]?

    enum CodingKeys: String, CodingKey {
        case object, name
        case manaCost = "mana_cost"
        case typeLine = "type_line"
        case oracleText = "oracle_text"
        case power, toughness
        case flavorText = "flavor_text"
        case artist
        case artistID = "artist_id"
        case illustrationID = "illustration_id"
        case watermark, colors
        case imageUris = "image_uris"
        case colorIndicator = "color_indicator"
    }
}

enum Color: String, Codable {
    case b = "B"
    case g = "G"
    case r = "R"
    case u = "U"
    case w = "W"
}

// MARK: - ImageUris
struct ImageUris: Codable {
    let small, normal, large: String
    let png: String
    let artCrop, borderCrop: String

    enum CodingKeys: String, CodingKey {
        case small, normal, large, png
        case artCrop = "art_crop"
        case borderCrop = "border_crop"
    }
}

enum FrameEffect: String, Codable {
    case devoid = "devoid"
    case legendary = "legendary"
    case sunmoondfc = "sunmoondfc"
}

enum Game: String, Codable {
    case arena = "arena"
    case mtgo = "mtgo"
    case paper = "paper"
}

enum Lang: String, Codable {
    case en = "en"
}

enum Layout: String, Codable {
    case adventure = "adventure"
    case leveler = "leveler"
    case normal = "normal"
    case split = "split"
    case transform = "transform"
}

// MARK: - Legalities
struct Legalities: Codable {
    let standard, future, historic, pioneer: Brawl
    let modern, legacy, pauper, vintage: Brawl
    let penny, commander, brawl, duel: Brawl
    let oldschool: Brawl
}

enum Brawl: String, Codable {
    case legal = "legal"
    case notLegal = "not_legal"
}

enum DatumObject: String, Codable {
    case card = "card"
}

// MARK: - Preview
struct Preview: Codable {
    let source: String
    let sourceURI: String
    let previewedAt: String

    enum CodingKeys: String, CodingKey {
        case source
        case sourceURI = "source_uri"
        case previewedAt = "previewed_at"
    }
}

// MARK: - PurchaseUris
struct PurchaseUris: Codable {
    let tcgplayer, cardmarket, cardhoarder: String
}

enum Rarity: String, Codable {
    case common = "common"
    case mythic = "mythic"
    case rare = "rare"
    case uncommon = "uncommon"
}

// MARK: - RelatedUris
struct RelatedUris: Codable {
    let gatherer: String?
    let tcgplayerDecks, edhrec, mtgtop8: String

    enum CodingKeys: String, CodingKey {
        case gatherer
        case tcgplayerDecks = "tcgplayer_decks"
        case edhrec, mtgtop8
    }
}

enum SetType: String, Codable {
    case commander = "commander"
    case core = "core"
    case draftInnovation = "draft_innovation"
    case duelDeck = "duel_deck"
    case expansion = "expansion"
    case funny = "funny"
    case masters = "masters"
    case planechase = "planechase"
    case starter = "starter"
}
