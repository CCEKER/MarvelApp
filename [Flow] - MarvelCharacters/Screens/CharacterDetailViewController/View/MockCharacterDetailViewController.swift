//
//  MockCharacterDetailViewController.swift
//  MarvelAppTests
//
//  Created by Cagatay Ceker on 5.06.2024.
//

import Foundation
@testable import MarvelApp

class MockCharacterDetailViewController: CharacterDetailViewControllerProtocol {
    
    var displayCharacterDetailViewStateDidCall: Bool = false
    var viewState: CharacterDetailViewState? = nil
    
    func displayCharacterDetailViewState(_ viewState: CharacterDetailViewState) {
        displayCharacterDetailViewStateDidCall = true
        self.viewState = viewState
    }
}
