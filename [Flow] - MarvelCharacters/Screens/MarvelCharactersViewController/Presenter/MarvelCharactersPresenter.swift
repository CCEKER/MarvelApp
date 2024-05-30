//
//  MarvelCharactersPresenter.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 28.05.2024.
//

import Foundation

protocol MarvelCharactersPresenterProtocol {
    func presentCharacters(_ character: [Character])
    func presentLoading()
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
        viewController?.displayCharacterViewState(.initial(viewModel))
    }
    
    func presentLoading() {
        let caption = "Loading..."
        let viewModel = MarvelLoadingViewModel(caption: caption)
        viewController?.displayCharacterViewState(.loading(viewModel))
    }
}
