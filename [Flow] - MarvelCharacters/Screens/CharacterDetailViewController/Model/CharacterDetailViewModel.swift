//
//  CharacterDetailViewModel.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 29.05.2024.
//

import Foundation

enum CharacterDetailViewState {
    case initial(CharacterDetailViewModel)
}

struct CharacterDetailViewModel: Equatable {
    let name: String
    let imageUrl: String
    let description: String
    let comics: [ComicsItem]
    let infoLabel: String
}
