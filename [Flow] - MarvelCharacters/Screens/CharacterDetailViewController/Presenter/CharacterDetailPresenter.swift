//
//  CharacterDetailPresenter.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 29.05.2024.
//

import Foundation

protocol CharacterDetailPresenterProtocol {
    func presentSelectedCharacter(_ selectedCharacter: Character, sortedComics: [ComicsItem])
}

final class CharacterDetailPresenter: CharacterDetailPresenterProtocol {
    
    weak var viewController: CharacterDetailViewControllerProtocol?
    
    func presentSelectedCharacter(_ selectedCharacter: Character, sortedComics: [ComicsItem]) {
        
        var arrangedSortedComics = sortedComics
        
        if sortedComics.count == 0 {
            let noComics = ComicsItem(
                resourceURI: "",
                name: "No comics found."
            )
            arrangedSortedComics = [noComics]
        }
        
        let viewModel = CharacterDetailViewModel(
            name: selectedCharacter.name,
            imageUrl: selectedCharacter.thumbnail.path + "." + selectedCharacter.thumbnail.thumbnailExtension,
            description: selectedCharacter.description,
            comics: arrangedSortedComics,
            infoLabel: "Comics Published After 2005"
        )
        viewController?.displayCharacterDetailViewModel(viewModel)
    }
}
