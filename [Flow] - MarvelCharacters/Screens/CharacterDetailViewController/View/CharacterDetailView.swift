//
//  CharacterDetailView.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 29.05.2024.
//

import UIKit

class CharacterDetailView: UIView {
    
    private let characterDetailImageView: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.layer.shadowColor = UIColor.red.cgColor
        container.layer.shadowOffset = CGSize(width: 0, height: 0)
        container.layer.shadowOpacity = 1
        container.layer.shadowRadius = 20
        container.clipsToBounds = false
        
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.borderWidth = 3
        view.layer.cornerRadius = 90
        view.clipsToBounds = true
        
        container.addSubview(view)
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: container.topAnchor),
            view.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            view.heightAnchor.constraint(equalToConstant: 180)
        ])
        
        return container
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
    
    private lazy var characterLabelStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [characterName, descriptionLabel])
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
        addSubview(characterDetailImageView)
        addSubview(characterLabelStackView)
        addSubview(descriptionLabel)
        addSubview(infoLabel)
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            characterDetailImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            characterDetailImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24),
            characterDetailImageView.heightAnchor.constraint(equalToConstant: 180),
            characterDetailImageView.widthAnchor.constraint(equalToConstant: 180),
        
            characterLabelStackView.topAnchor.constraint(equalTo: characterDetailImageView.bottomAnchor, constant: 24),
            characterLabelStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            characterLabelStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            descriptionLabel.topAnchor.constraint(equalTo: characterLabelStackView.bottomAnchor, constant: 30),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            infoLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            tableView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 12),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func reloadWith(_ viewModel: CharacterDetailViewModel) {
        
        characterName.text = viewModel.name
        descriptionLabel.text = viewModel.description.isEmpty ? "No description found." : viewModel.description
        infoLabel.text = viewModel.infoLabel
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: URL(string: viewModel.imageUrl)!), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    guard let imageView = self.characterDetailImageView.subviews[0] as? UIImageView else { return }
                    imageView.image = image
                }
            }
        }
    }
}
