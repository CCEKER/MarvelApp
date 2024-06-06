//
//  CharacterDetailInteractorTests.swift
//  MarvelAppTests
//
//  Created by Cagatay Ceker on 6.06.2024.
//

import XCTest
@testable import MarvelApp

final class CharacterDetailInteractorTests: XCTestCase {
    
    func test_extractYear_whenYearIsInStringFormat_shouldReturnCorrectYear() {
        
        let env = InteractorEnvironment()
        let sut = env.makeSUT()
        
        let expected = [
            ("Spider-Man (2003)", 2003),
            ("X-Men (1995)", 1995),
            ("The Avengers (2012)", 2012)
        ]
        expected.forEach { (input, expected) in
            let result = sut.extractionYear(from: input)
            XCTAssertEqual(result, expected, "Expected \(String(describing: expected)) but got \(String(describing: result)) for input \(input)")
        }
    }
    
    func test_viewDidLoad_presentsFilteredAndSorted_comicsCorrectly() {
        
        let env = InteractorEnvironment()
        let sut = env.makeSUT()
        sut.viewDidLoad()
        let expectedCall = env.characterDetailPresenter.presentSelectedCharacterDidCall
        
        XCTAssertTrue(expectedCall, "presentSelectedCharacter should have been called.")
        
        let expectedCount = 2
        let actualCount = env.characterDetailPresenter.lastPresentedComics.count
        XCTAssertEqual(actualCount, expectedCount, "Should present only comics after 2005")
        
        if actualCount >= expectedCount {
            XCTAssertEqual(env.characterDetailPresenter.lastPresentedComics[0].name, "The Avengers (2012)", "Comics should be sorted by year in descending order")
            XCTAssertEqual(env.characterDetailPresenter.lastPresentedComics[1].name, "Iron Man (2008)", "Comics should be sorted by year in descending order")
        } else {
            XCTFail("Not enough comics to test sorting.")
        }
        
        let comicItem1 = ComicsItem(resourceURI: "someURI", name: "The Avengers (2012)")
        let comicItem2 = ComicsItem(resourceURI: "someURI", name: "Comic 2 (2006)")
        let comicItem3 = ComicsItem(resourceURI: "someURI", name: "Comic 3 (2006)")
        let comicItem4 = ComicsItem(resourceURI: "someURI", name: "Comic 4 (2006)")
        let comicItem5 = ComicsItem(resourceURI: "someURI", name: "Comic 5 (2006)")
        let comicItem6 = ComicsItem(resourceURI: "someURI", name: "Comic 6 (2006)")
        let comicItem7 = ComicsItem(resourceURI: "someURI", name: "Comic 7 (2006)")
        let comicItem8 = ComicsItem(resourceURI: "someURI", name: "Comic 8 (2006)")
        let comicItem9 = ComicsItem(resourceURI: "someURI", name: "Comic 9 (2006)")
        let comicItem10 = ComicsItem(resourceURI: "someURI", name: "Comic 10 (2006)")
        let comicItem11 = ComicsItem(resourceURI: "someURI", name: "Comic 11 (2006)")
        let comicItem12 = ComicsItem(resourceURI: "someURI", name: "Comic 12 (2006)")
        
        let comics = Comics(
            available: 12,
            collectionURI: "collectionURI",
            items: [comicItem1, comicItem2, comicItem3, comicItem4, comicItem5, comicItem6, comicItem7, comicItem8, comicItem9, comicItem10, comicItem11, comicItem12],
            returned: 12
        )
        env.selectedCharacter = Character(
            id: 123,
            name: "name",
            description: "description",
            modified: "modified",
            thumbnail: .init(path: "path", thumbnailExtension: "ext"),
            resourceURI: "resourceURI",
            comics: comics,
            series: Seeds.getCharacter().series,
            stories: Seeds.getCharacter().stories,
            events: Seeds.getCharacter().events,
            urls: nil
        )
        
        XCTAssertLessThanOrEqual(env.characterDetailPresenter.lastPresentedComics.count, 10, "Should present at most 10 comics.")
        if env.characterDetailPresenter.lastPresentedComics.count <= 10 {
            XCTAssertEqual(env.characterDetailPresenter.lastPresentedComics[0].name, "The Avengers (2012)", "First comic should be 'The Avengers (2012)'")
        }
    }
}

final class InteractorEnvironment {
    
    var characterDetailPresenter = MockCharacterDetailPresenter()
    var characterDetailCoordinator = MockCharacterDetailCoordinator()
    var selectedCharacter = Seeds.getCharacter()
    
    func makeSUT() -> CharacterDetailInteractor {
        
        let sut = CharacterDetailInteractor(selectedCharacter: selectedCharacter, presenter: characterDetailPresenter)
        sut.coordinator = characterDetailCoordinator
        return sut
    }
}
