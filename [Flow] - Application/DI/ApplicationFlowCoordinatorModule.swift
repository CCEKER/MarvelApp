//
//  ApplicationFlowCoordinatorModule.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 28.05.2024.
//

import Foundation
import Swinject

protocol ApplicationFlowCoordinatorResolver {
    func resolveMarvelCharactersFlowCoordinator(window: UIWindow, delegate: MarvelCharactersFlowCoordinatorDelegate) -> MarvelCharactersFlowCoordinatorProtocol
}

final class ApplicationFlowCoordinatorModule: ApplicationFlowCoordinatorResolver {
    
    private let container: Container
    
    init(parentContainer: Container) {
        container = Container(parent: parentContainer)
        _ = Assembler([ApplicationFlowCoordinatorAssembly()], container: container)
    }
    
    func resolveMarvelCharactersFlowCoordinator(window: UIWindow, delegate: MarvelCharactersFlowCoordinatorDelegate) -> MarvelCharactersFlowCoordinatorProtocol {
        MarvelCharactersFlowCoordinator.build(window: window, delegate: delegate, container: container)
    }
}
