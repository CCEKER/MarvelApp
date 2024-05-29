//
//  CharacterDetailViewController.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 29.05.2024.
//

import UIKit

protocol CharacterDetailViewControllerProtocol: AnyObject {
    func displayCharacterDetailViewModel(_ viewModel: CharacterDetailViewModel)
}

class CharacterDetailViewController: UIViewController {
    
    private let customView = CharacterDetailView()
    private let interactor: CharacterDetailInteractorProtocol
    
    init(interactor: CharacterDetailInteractorProtocol) {
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
        
        interactor.viewDidLoad()
    }
}

extension CharacterDetailViewController: CharacterDetailViewControllerProtocol {
    
    func displayCharacterDetailViewModel(_ viewModel: CharacterDetailViewModel) {
        self.customView.reloadWith(viewModel)
    }
}
