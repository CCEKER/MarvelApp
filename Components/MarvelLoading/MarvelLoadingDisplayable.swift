//
//  MarvelLoadingDisplayable.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 29.05.2024.
//

import Foundation
import UIKit

protocol MarvelLoadingDisplayable {
    func showLoading(viewModel: MarvelLoadingViewModel)
    func hideLoading()
}

extension MarvelLoadingDisplayable where Self: UIViewController {
    
    func showLoading(viewModel: MarvelLoadingViewModel) {
        let viewController = MarvelLoadingViewController(viewModel: viewModel)
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChild(viewController)
        self.view.addSubview(viewController.view)
        
        NSLayoutConstraint.activate([
            viewController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            viewController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            viewController.view.topAnchor.constraint(equalTo: self.view.topAnchor),
            viewController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        
        viewController.didMove(toParent: self)
    }
    
    func hideLoading() {
        guard let viewController = self.children.first(where: {$0.isKind(of: MarvelLoadingViewController.self)}) else {
            return
        }
        
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
}
