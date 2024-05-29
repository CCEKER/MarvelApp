//
//  CharacterDetailPresenter.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 29.05.2024.
//

import Foundation

protocol CharacterDetailPresenterProtocol {
    func presentSelectedCharacter(_ selectedCharacter: Character)
}

final class CharacterDetailPresenter: CharacterDetailPresenterProtocol {
    
    weak var viewController: CharacterDetailViewControllerProtocol?
    
    func presentSelectedCharacter(_ selectedCharacter: Character) {
        
        let viewModel = CharacterDetailViewModel(
            name: selectedCharacter.name,
            imageUrl: selectedCharacter.thumbnail.path + "." + selectedCharacter.thumbnail.thumbnailExtension,
            description: selectedCharacter.description,
            comics: selectedCharacter.comics?.items ?? []
        )
        viewController?.displayCharacterDetailViewModel(viewModel)
    }
}
