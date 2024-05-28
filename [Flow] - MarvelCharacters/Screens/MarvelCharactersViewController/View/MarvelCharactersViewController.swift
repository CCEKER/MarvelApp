//
//  MarvelCharactersViewController.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 28.05.2024.
//

import UIKit

protocol MarvelCharactersViewControllerProtocol: AnyObject {
    
}

class MarvelCharactersViewController: UIViewController {
    
    private let customView = MarvelCharactersView()
    private let interactor: MarvelCharactersInteractorProtocol
    
    init(interactor: MarvelCharactersInteractorProtocol) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MarvelCharactersViewController: MarvelCharactersViewControllerProtocol {
    
}
