//
//  ApplicationFlowCoordinator+Build.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 28.05.2024.
//

import Swinject

extension ApplicationFlowCoordinator {
    static func build(window: UIWindow, container: Container) -> ApplicationFlowCoordinatorProtocol {
        let module = ApplicationFlowCoordinatorModule(parentContainer: container)
        return ApplicationFlowCoordinator(window: window, resolver: module)
    }
}
