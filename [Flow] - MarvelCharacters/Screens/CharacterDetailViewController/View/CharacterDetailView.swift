//
//  CharacterDetailView.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 29.05.2024.
//

import UIKit

class CharacterDetailView: UIView {
    
    private let characterDetailImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.borderWidth = 5
        view.clipsToBounds = true
        view.layer.cornerRadius = 90
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.red.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 1
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .black
        addSubview(characterDetailImage)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            characterDetailImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            characterDetailImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            characterDetailImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            characterDetailImage.heightAnchor.constraint(equalToConstant: 180),
        ])
    }
    
    func reloadWith(_ viewModel: CharacterDetailViewModel) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: URL(string: viewModel.imageUrl)!), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.characterDetailImage.image = image
                }
            }
        }
    }
}
