//
//  CharacterDetailInteractor.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 29.05.2024.
//

import Foundation

protocol CharacterDetailInteractorProtocol {
    func viewDidLoad()
}

protocol CharacterDetailInteractorCoordinatorDelegate: AnyObject {
    
}

final class CharacterDetailInteractor {
    
    private let selectedCharacter: Character
    private let presenter: CharacterDetailPresenterProtocol
    weak var coordinator: CharacterDetailInteractorCoordinatorDelegate?
    
    init(selectedCharacter: Character, presenter: CharacterDetailPresenterProtocol) {
        self.selectedCharacter = selectedCharacter
        self.presenter = presenter
    }
}

extension CharacterDetailInteractor: CharacterDetailInteractorProtocol {
    
    func viewDidLoad() {
        
        let sortedFilteredComics = selectedCharacter.comics?.items.compactMap { comic -> (comic: ComicsItem, year: Int)? in
            guard let year = extractYearSimpe(from: comic.name) else { return nil }
            return (comic, year)
        }
            .filter { $0.year > 2005 }
            .sorted { $0.year > $1.year }
            .map { $0.comic }
        
        let comicsTopresent = Array(sortedFilteredComics?.prefix(10) ?? [])
        presenter.presentSelectedCharacter(self.selectedCharacter, sortedComics: comicsTopresent)
    }
    
    private func extractYearSimpe(from name: String) -> Int? {
        if let yearSubstring = name.split(separator: "(").last?.prefix(4), let year = Int(yearSubstring) {
            return year
        }
        return nil
    }
}
