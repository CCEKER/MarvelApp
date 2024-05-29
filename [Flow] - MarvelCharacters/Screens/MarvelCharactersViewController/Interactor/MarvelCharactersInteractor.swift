//
//  MarvelCharactersInteractor.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 28.05.2024.
//

import Foundation

protocol MarvelCharactersInteractorProtocol {
    func viewDidLoad()
    func didTapCharacter(at index: Int)
}

protocol MarvelCharactersInteractorCoordinatorDelegate: AnyObject {
    func didTapCharacter(character: Character)
}

final class MarvelCharactersInteractor {
    
    private let presenter: MarvelCharactersPresenterProtocol
    private let characterService: CharacterServiceProtocol
    weak var coordinator: MarvelCharactersInteractorCoordinatorDelegate?
    private var offset = 0
    private var characters: [Character] = []
    private var isLoading = false
    
    init(presenter: MarvelCharactersPresenterProtocol, characterService: CharacterServiceProtocol) {
        self.presenter = presenter
        self.characterService = characterService
    }
}

extension MarvelCharactersInteractor: MarvelCharactersInteractorProtocol {
    
    func viewDidLoad() {
        
        guard !isLoading else { return }
        isLoading = true
        
        characterService.getCharacters(offset: offset) { [weak self] result in
            guard let self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let list):
                    self.characters.append(contentsOf: list)
                    self.offset += APIConstants.defaultLimit
                    self.presenter.presentCharacters(self.characters)
                case .failure(let error):
                    print(error)
                }
                self.isLoading = false
            }
        }
    }
    
    func didTapCharacter(at index: Int) {
        
        let selectedCharacter = characters[index]
        self.coordinator?.didTapCharacter(character: selectedCharacter)
    }
}
