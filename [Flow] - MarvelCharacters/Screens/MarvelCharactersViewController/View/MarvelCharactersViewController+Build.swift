//
//  MarvelCharactersViewController+Build.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 28.05.2024.
//

import UIKit

extension MarvelCharactersViewController {
    static func build(coordinator: MarvelCharactersInteractorCoordinatorDelegate, characterService: CharacterServiceProtocol) -> UIViewController {
        let presenter = MarvelCharactersPresenter()
        let interactor = MarvelCharactersInteractor(presenter: presenter, characterService: characterService)
        interactor.coordinator = coordinator
        let viewController = MarvelCharactersViewController(interactor: interactor)
        presenter.viewController = viewController
        return viewController
    }
}
