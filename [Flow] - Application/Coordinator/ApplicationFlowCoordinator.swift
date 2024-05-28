//
//  ApplicationFlowCoordinator.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 28.05.2024.
//

import UIKit

protocol ApplicationFlowCoordinatorProtocol {
    func start()
}

final class ApplicationFlowCoordinator: ApplicationFlowCoordinatorProtocol {
    
    private let window: UIWindow
    private let resolver: ApplicationFlowCoordinatorResolver
    private var marvelCharactersFlowCoordinator: MarvelCharactersFlowCoordinatorProtocol?
    
    init(window: UIWindow, resolver: ApplicationFlowCoordinatorResolver) {
        self.window = window
        self.resolver = resolver
    }
    
    func start() {
        marvelCharactersFlowCoordinator = resolver.resolveMarvelCharactersFlowCoordinator(window: self.window, delegate: self)
        marvelCharactersFlowCoordinator?.start()
    }
}

extension ApplicationFlowCoordinator: MarvelCharactersFlowCoordinatorDelegate {
    
}
