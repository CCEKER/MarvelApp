//
//  MarvelCharactersInteractor.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 28.05.2024.
//

import Foundation

protocol MarvelCharactersInteractorProtocol {
    func viewDidLoad()
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
    
    func viewDidLoad() {
        characterService.getCharacters(offset: 2) { result in
            switch result {
            case .success(let result):
                self.presenter.presentCharacters(result)
            case .failure(let error):
                print(error)
            }
        }
    }
}
