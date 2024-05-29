//
//  CharacterDetailViewController+Build.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 29.05.2024.
//

import UIKit

extension CharacterDetailViewController {
    static func build(coordinator: CharacterDetailInteractorCoordinatorDelegate, selectedCharacter: Character) -> UIViewController {
        let presenter = CharacterDetailPresenter()
        let interactor = CharacterDetailInteractor(selectedCharacter: selectedCharacter, presenter: presenter)
        interactor.coordinator = coordinator
        let viewController = CharacterDetailViewController(interactor: interactor)
        presenter.viewController = viewController
        return viewController
    }
}
