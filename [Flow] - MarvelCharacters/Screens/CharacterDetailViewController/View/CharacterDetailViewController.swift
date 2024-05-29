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
    private var tableData: [ComicsItem] = []
    
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
        
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
        
        interactor.viewDidLoad()
    }
}

extension CharacterDetailViewController: CharacterDetailViewControllerProtocol {
    
    func displayCharacterDetailViewModel(_ viewModel: CharacterDetailViewModel) {
        self.tableData = viewModel.comics
        self.customView.reloadWith(viewModel)
        self.customView.tableView.reloadData()
    }
}

extension CharacterDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CharacterDetailTableViewCell
        let comics = tableData[indexPath.row]
        cell.reloadWith(comics)
        return cell
    }
}
