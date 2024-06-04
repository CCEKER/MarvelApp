//
//  Character.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 28.05.2024.
//

import Foundation

struct BaseResponseModel: Codable {
    let code: Int
    let status: String
    let data: DataInfo
}

struct DataInfo: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Character]
}

struct Character: Identifiable, Codable {
    let id: Int
    let name: String
    let description: String
    let modified: String
    let thumbnail: Thumbnail
    let resourceURI: String?
    let comics, series: Comics?
    let stories: Stories?
    let events: Comics?
    let urls: [URLElement]?

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case modified
        case thumbnail
        case resourceURI
        case comics
        case series
        case stories
        case events
        case urls
    }
}

struct Comics: Codable {
    let available: Int
    let collectionURI: String
    let items: [ComicsItem]
    let returned: Int
}

struct ComicsItem: Codable, Equatable {
    let resourceURI: String
    let name: String
}

struct Stories: Codable {
    let available: Int
    let collectionURI: String
    let items: [StoriesItem]
    let returned: Int
}

struct StoriesItem: Codable {
    let resourceURI: String
    let name: String
    let type: TypeEnum
}

enum TypeEnum: String, Codable {
    case cover = "cover"
    case interiorStory = "interiorStory"
    case unknown
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)
        switch value {
        case "cover":
            self = .cover
        case "interiorStory":
            self = .interiorStory
        default:
            self = .unknown
        }
    }
}

struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: String

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

struct URLElement: Codable {
    let type: String
    let url: String
}
