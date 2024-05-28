//
//  MarvelCharactersViewController.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 28.05.2024.
//

import UIKit

protocol MarvelCharactersViewControllerProtocol: AnyObject {
    func displayCharacterViewModel(_ viewModel: [CharacterViewModel])
}

class MarvelCharactersViewController: UIViewController {
    
    private let customView = MarvelCharactersView()
    private let interactor: MarvelCharactersInteractorProtocol
    private var tableData: [CharacterViewModel] = []
    
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
        
        self.customView.tableView.dataSource = self
        self.customView.tableView.delegate = self
        
        interactor.viewDidLoad()
    }
}

extension MarvelCharactersViewController: MarvelCharactersViewControllerProtocol {
    
    func displayCharacterViewModel(_ viewModel: [CharacterViewModel]) {
        self.tableData = viewModel
        self.customView.tableView.reloadData()
    }
}

extension MarvelCharactersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CharacterTableViewCell
        let viewModel = tableData[indexPath.row]
        cell.reloadWith(viewModel)
        return cell
    }
}
