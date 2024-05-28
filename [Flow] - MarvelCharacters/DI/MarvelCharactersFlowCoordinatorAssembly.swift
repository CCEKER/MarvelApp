//
//  MarvelCharactersFlowCoordinatorAssembly.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 28.05.2024.
//

import Foundation
import Swinject

final class MarvelCharactersFlowCoordinatorAssembly: Assembly {
    func assemble(container: Container) {
        container.register(CharacterServiceProtocol.self) { _ in
            CharacterService()
        }
    }
}
