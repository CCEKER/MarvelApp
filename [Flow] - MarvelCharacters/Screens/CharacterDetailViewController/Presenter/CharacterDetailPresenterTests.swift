//
//  CharacterDetailPresenterTests.swift
//  MarvelAppTests
//
//  Created by Cagatay Ceker on 5.06.2024.
//

import XCTest
@testable import MarvelApp

final class CharacterDetailPresenterTests: XCTestCase {
    
    func test_presentSelectedCharacter_whenSortedComicsAreEmpty_shouldReturnNoComis() {
        
        let env = Environment()
        let sut = env.makeSUT()
        
        let seed = Seeds.getCharacter()
        sut.presentSelectedCharacter(seed, sortedComics: [])
        
        let viewState = env.characterDetailViewController.viewState
        
        guard case .initial(let viewModel) = viewState else {
            XCTFail(".initial expected")
            return
        }
        
        let expected = ComicsItem(resourceURI: "", name: "No comics found.")
        XCTAssertEqual(viewModel.comics[0].name, expected.name)
        XCTAssertEqual(viewModel.comics[0].resourceURI, expected.resourceURI)
    }
    
    func test_presentSelectedCharacter_whenSortedComicsAreGiven_shouldReturnCorrectViewModel() {
        
        let env = Environment()
        let sut = env.makeSUT()
        let seed = Seeds.getCharacter()
        
        var sortedComics: [ComicsItem] = []
        sortedComics.append(contentsOf: seed.comics?.items ?? [])
        sortedComics.append(contentsOf: seed.series?.items ?? [])
        sortedComics.append(contentsOf: seed.events?.items ?? [])
        
        sut.presentSelectedCharacter(seed, sortedComics: sortedComics)
        
        let viewState = env.characterDetailViewController.viewState
        
        guard case .initial(let viewModel) = viewState else {
            XCTFail(".initial expected")
            return
        }
        
        let expectedViewModel = CharacterDetailViewModel(
            name: seed.name,
            imageUrl: seed.thumbnail.path + "." + seed.thumbnail.thumbnailExtension,
            description: seed.description,
            comics: sortedComics,
            infoLabel: "Comics Published After 2005"
        )
        
        XCTAssertEqual(viewModel, expectedViewModel)
    }
}

final class Environment {
    
    var characterDetailViewController = MockCharacterDetailViewController()
    
    func makeSUT() -> CharacterDetailPresenter {
        let sut = CharacterDetailPresenter()
        sut.viewController = characterDetailViewController
        return sut
    }
}

struct Seeds {
    static func getCharacter() -> Character {
        let storyItem = StoriesItem(resourceURI: "resourceURI", name: "name", type: .cover)
        let stories = Stories(available: 1, collectionURI: "collectionURI", items: [storyItem], returned: 1)
        
        let comicItem1 = ComicsItem(resourceURI: "someURI", name: "The Avengers (2012)")
        let comicItem2 = ComicsItem(resourceURI: "someURI", name: "Iron Man (2008)")
        let comicItem3 = ComicsItem(resourceURI: "someURI", name: "The Incredible Hulk (2003)")
        let comics = Comics(available: 3, collectionURI: "collectionURI", items: [comicItem1, comicItem2, comicItem3], returned: 3)
        
        let seriesItem = ComicsItem(resourceURI: "resourceURI", name: "series")
        let series = Comics(available: 2, collectionURI: "collectionURI", items: [seriesItem], returned: 1)
        
        let eventsItem = ComicsItem(resourceURI: "resourceURI", name: "events")
        let events = Comics(available: 3, collectionURI: "collectionURI", items: [eventsItem], returned: 1)
        
        return Character(
            id: 123,
            name: "name",
            description: "description",
            modified: "modified",
            thumbnail: .init(path: "path", thumbnailExtension: "ext"),
            resourceURI: "resourceURI",
            comics: comics,
            series: series,
            stories: stories,
            events: events,
            urls: nil
        )
    }
}
