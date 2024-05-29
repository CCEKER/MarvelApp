//
//  CharacterViewModel.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 28.05.2024.
//

import Foundation

enum CharacterViewState {
    case initial([CharacterViewModel])
    case loading(MarvelLoadingViewModel)
}

struct CharacterViewModel {
    let id: Int
    let name: String
    let description: String
    let imageUrl: String?
}
