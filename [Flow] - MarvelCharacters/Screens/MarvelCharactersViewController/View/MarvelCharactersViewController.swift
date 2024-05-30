//
//  MarvelCharactersViewController.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 28.05.2024.
//

import UIKit

protocol MarvelCharactersViewControllerProtocol: AnyObject {
    func displayCharacterViewState(_ viewState: CharacterViewState)
}

class MarvelCharactersViewController: UIViewController, MarvelLoadingDisplayable {
    
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
        
        configureNavigationBar()
        
        self.customView.tableView.dataSource = self
        self.customView.tableView.delegate = self
        
        interactor.viewDidLoad()
    }
    
    private func configureNavigationBar() {
        title = "Character List"
        if let navController = navigationController {
            navController.navigationBar.tintColor = .red
            navController.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.red,
                NSAttributedString.Key.font: FontManager.marvelRegularFont(ofSize: 20)
            ]
        }
    }
}

extension MarvelCharactersViewController: MarvelCharactersViewControllerProtocol {
    
    func displayCharacterViewState(_ viewState: CharacterViewState) {
        
        switch viewState {
            
        case .initial(let viewModel):
            self.tableData = viewModel
            self.customView.tableView.reloadData()
            hideLoading()
            
        case .loading:
            showLoading(viewModel: .init(caption: "Loading..."))
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        interactor.didTapCharacter(at: indexPath.row)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let scrollViewHeight = scrollView.frame.size.height
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > (contentHeight - scrollViewHeight) {
            interactor.viewDidLoad()
        }
    }
}

