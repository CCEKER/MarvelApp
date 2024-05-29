//
//  CharacterDetailInteractor.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 29.05.2024.
//

import Foundation

protocol CharacterDetailInteractorProtocol {
    func viewDidLoad()
}

protocol CharacterDetailInteractorCoordinatorDelegate: AnyObject {
    
}

final class CharacterDetailInteractor {
    
    private let selectedCharacter: Character
    private let presenter: CharacterDetailPresenterProtocol
    weak var coordinator: CharacterDetailInteractorCoordinatorDelegate?
    
    init(selectedCharacter: Character, presenter: CharacterDetailPresenterProtocol) {
        self.selectedCharacter = selectedCharacter
        self.presenter = presenter
    }
}

extension CharacterDetailInteractor: CharacterDetailInteractorProtocol {
    
    func viewDidLoad() {
        presenter.presentSelectedCharacter(self.selectedCharacter)
    }
}
