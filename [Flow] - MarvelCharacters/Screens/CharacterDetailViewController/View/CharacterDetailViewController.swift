//
//  CharacterDetailViewController.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 29.05.2024.
//

import UIKit

protocol CharacterDetailViewControllerProtocol: AnyObject {
    func displayCharacterDetailViewState(_ viewState: CharacterDetailViewState)
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
        
        configureNavigationBar()
        
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
        
        interactor.viewDidLoad()
    }
    
    private func configureNavigationBar() {
        self.navigationController?.navigationBar.tintColor = .red
        self.navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }
}

extension CharacterDetailViewController: CharacterDetailViewControllerProtocol {
    
    func displayCharacterDetailViewState(_ viewState: CharacterDetailViewState) {
        
        switch viewState {
        case .initial(let viewModel):
            self.tableData = viewModel.comics
            self.customView.reloadWith(viewModel)
            self.customView.tableView.reloadData()
        }
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
