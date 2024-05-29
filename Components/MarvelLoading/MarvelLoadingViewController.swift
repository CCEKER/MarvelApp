//
//  MarvelLoadingViewController.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 29.05.2024.
//

import UIKit

class MarvelLoadingViewController: UIViewController {
    
    private let loadingView = MarvelLoadingView()
    private(set) var viewModel: MarvelLoadingViewModel!
    
    init(viewModel: MarvelLoadingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingView.viewModel = viewModel
    }
    
    override func loadView() {
        self.view = loadingView
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
}
