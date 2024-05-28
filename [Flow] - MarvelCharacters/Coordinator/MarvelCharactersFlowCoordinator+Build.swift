//
//  MarvelCharactersFlowCoordinator+Build.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 28.05.2024.
//

import Swinject

extension MarvelCharactersFlowCoordinator {
    static func build(window: UIWindow, delegate: MarvelCharactersFlowCoordinatorDelegate, container: Container) -> MarvelCharactersFlowCoordinatorProtocol {
        let module = MarvelCharactersFlowCoordinatorModule(parentContainer: container)
        return MarvelCharactersFlowCoordinator(window: window, delegate: delegate, resolver: module)
    }
}
