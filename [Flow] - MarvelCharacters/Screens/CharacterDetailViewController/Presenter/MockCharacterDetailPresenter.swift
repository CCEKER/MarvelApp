//
//  MockCharacterDetailPresenter.swift
//  MarvelAppTests
//
//  Created by Cagatay Ceker on 6.06.2024.
//

import Foundation
@testable import MarvelApp

class MockCharacterDetailPresenter: CharacterDetailPresenterProtocol {
    
    var presentSelectedCharacterDidCall = false
    var lastPresentedCharacter: Character?
    var lastPresentedComics: [ComicsItem] = []
    
    func presentSelectedCharacter(_ selectedCharacter: Character, sortedComics: [ComicsItem]) {
        presentSelectedCharacterDidCall = true
        lastPresentedCharacter = selectedCharacter
        lastPresentedComics = sortedComics
    }
}
