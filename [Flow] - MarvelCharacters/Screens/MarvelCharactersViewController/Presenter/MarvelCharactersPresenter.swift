//
//  MarvelCharactersPresenter.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 28.05.2024.
//

import Foundation

protocol MarvelCharactersPresenterProtocol {
    func presentCharacters(_ character: [Character])
}

final class MarvelCharactersPresenter: MarvelCharactersPresenterProtocol {
    
    weak var viewController: MarvelCharactersViewControllerProtocol?
    
    func presentCharacters(_ character: [Character]) {
        let viewModel = character.map { character in
            CharacterViewModel(
                id: character.id,
                name: character.name,
                description: character.description,
                imageUrl: character.thumbnail.path + "." + character.thumbnail.thumbnailExtension
            )
        }
        viewController?.displayCharacterViewModel(viewModel)
        print(viewModel.first?.imageUrl)
    }
}
