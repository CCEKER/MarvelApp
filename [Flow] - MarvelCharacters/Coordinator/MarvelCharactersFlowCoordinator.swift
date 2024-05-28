//
//  MarvelCharactersFlowCoordinator.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 28.05.2024.
//

import UIKit

protocol MarvelCharactersFlowCoordinatorProtocol {
    func start()
}

protocol MarvelCharactersFlowCoordinatorDelegate {
    
}

final class MarvelCharactersFlowCoordinator: MarvelCharactersFlowCoordinatorProtocol {
    
    private let window: UIWindow
    private let delegate: MarvelCharactersFlowCoordinatorDelegate
    private var navigationController = UINavigationController()
    private let resolver: MarvelCharactersFlowCoordinatorResolver
    
    init(window: UIWindow, delegate: MarvelCharactersFlowCoordinatorDelegate, resolver: MarvelCharactersFlowCoordinatorResolver) {
        self.window = window
        self.delegate = delegate
        self.resolver = resolver
    }
    
    func start() {
        let marvelCharactersViewController = resolver.resolveMarvelCharactersViewController(delegate: self)
        self.navigationController.viewControllers = [marvelCharactersViewController]
        self.window.rootViewController = navigationController
    }
}

extension MarvelCharactersFlowCoordinator: MarvelCharactersInteractorCoordinatorDelegate {
    
}
