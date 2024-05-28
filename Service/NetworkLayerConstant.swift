//
//  NetworkLayerConstant.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 28.05.2024.
//

import UIKit

struct NetworkLayerConstant {
    static var baseURL: String {
        return "https://gateway.marvel.com/v1/public/characters?"
    }
}

enum APIConstants {
    static let defaultLimit = 30
}
