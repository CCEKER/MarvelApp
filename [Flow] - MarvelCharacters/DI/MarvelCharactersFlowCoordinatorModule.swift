//
//  MarvelCharactersFlowCoordinatorModule.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 28.05.2024.
//

import Foundation
import Swinject

protocol MarvelCharactersFlowCoordinatorResolver {
    func resolveMarvelCharactersViewController(delegate: MarvelCharactersInteractorCoordinatorDelegate) -> UIViewController
    func resolveCharacterDetailViewController(delegate: CharacterDetailInteractorCoordinatorDelegate, selectedCharacter: Character) -> UIViewController
}

final class MarvelCharactersFlowCoordinatorModule: MarvelCharactersFlowCoordinatorResolver {
    
    private let container: Container
    private let resolver: Resolver
    
    init(parentContainer: Container) {
        container = Container(parent: parentContainer)
        _ = Assembler([MarvelCharactersFlowCoordinatorAssembly()], container: container)
        self.resolver = container
    }
    
    func resolveMarvelCharactersViewController(delegate: MarvelCharactersInteractorCoordinatorDelegate) -> UIViewController {
        guard let characterService = resolver.resolve(CharacterServiceProtocol.self) else {
            fatalError("CharacterServiceProtocol should be registered.")
        }
        return MarvelCharactersViewController.build(coordinator: delegate, characterService: characterService)
    }
    
    func resolveCharacterDetailViewController(delegate: CharacterDetailInteractorCoordinatorDelegate, selectedCharacter: Character) -> UIViewController {
        CharacterDetailViewController.build(coordinator: delegate, selectedCharacter: selectedCharacter)
    }
}
