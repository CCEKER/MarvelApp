//
//  MarvelCharactersInteractor.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 28.05.2024.
//

import Foundation

protocol MarvelCharactersInteractorProtocol {
    
}

protocol MarvelCharactersInteractorCoordinatorDelegate: AnyObject {
    
}

final class MarvelCharactersInteractor {
    
    private let presenter: MarvelCharactersPresenterProtocol
    private let characterService: CharacterServiceProtocol
    weak var coordinator: MarvelCharactersInteractorCoordinatorDelegate?
    
    init(presenter: MarvelCharactersPresenterProtocol, characterService: CharacterServiceProtocol) {
        self.presenter = presenter
        self.characterService = characterService
    }
}

extension MarvelCharactersInteractor: MarvelCharactersInteractorProtocol {
    
}
