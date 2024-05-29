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
        view.layer.borderWidth = 3
        view.clipsToBounds = true
        view.layer.cornerRadius = 90
        view.layer.shadowColor = UIColor.red.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 1
        view.heightAnchor.constraint(equalToConstant: 180).isActive = true
        return view
    }()
    
    private let characterName: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.textColor = .systemRed
        view.font = UIFont(name: "Roboto", size: 20)
        view.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var characterImageStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [characterDetailImage, characterName, descriptionLabel])
        view.axis = .vertical
        view.spacing = 10
        view.alignment = .center
        view.distribution = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let descriptionLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Roboto", size: 16)
        view.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        view.textColor = .gray
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        return view
    }()
    
    private let infoLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Roboto", size: 15)
        view.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        view.textColor = .systemRed
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .black
        view.estimatedRowHeight = UITableView.automaticDimension
        view.separatorStyle = .none
        view.allowsSelection = true
        view.showsVerticalScrollIndicator = false
        view.alwaysBounceVertical = false
        view.register(CharacterDetailTableViewCell.self, forCellReuseIdentifier: "Cell")
        view.translatesAutoresizingMaskIntoConstraints = false
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
        addSubview(characterImageStackView)
        addSubview(descriptionLabel)
        addSubview(infoLabel)
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            characterImageStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            characterImageStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            characterImageStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            
            descriptionLabel.topAnchor.constraint(equalTo: characterImageStackView.bottomAnchor, constant: 30),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            infoLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            tableView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func reloadWith(_ viewModel: CharacterDetailViewModel) {
        
        characterName.text = viewModel.name
        descriptionLabel.text = viewModel.description.isEmpty ? "There is no description." : viewModel.description
        infoLabel.text = viewModel.infoLabel
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: URL(string: viewModel.imageUrl)!), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.characterDetailImage.image = image
                }
            }
        }
    }
}
