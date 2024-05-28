//
//  Character.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 28.05.2024.
//

import Foundation

struct CharacterDataWrapper: Codable {
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let etag: String
    let data: CharacterDataContainer
}

struct CharacterDataContainer: Codable {
    let offset, limit, total, count: Int
    let results: [Character]
}

struct Character: Codable {
    let id: Int
    let name, description, modified: String
    let thumbnail: Thumbnail
    let resourceURI: String
    let comics, series, stories, events: Collection
    let urls: [URL]
}

struct Collection: Codable {
    let available: Int
    let collectionURI: String
    let items: [CollectionItem]
    let returned: Int
}

struct CollectionItem: Codable {
    let resourceURI: String
    let name: String
}

struct Thumbnail: Codable {
    let path: String
    let `extension`: String
}

struct URL: Codable {
    let type: String
    let url: String
}
