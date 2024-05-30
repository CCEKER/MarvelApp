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
        view.font = FontManager.marvelRegularFont(ofSize: 20)
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
        view.font = FontManager.marvelRegularFont(ofSize: 13)
        view.textColor = .gray
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        return view
    }()
    
    private let infoLabel: UILabel = {
        let view = UILabel()
        view.font = FontManager.marvelRegularFont(ofSize: 15)
        view.textColor = .systemRed
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .systemBackground
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
        backgroundColor = .systemBackground
        addSubview(characterDetailImageView)
        addSubview(characterLabelStackView)
        addSubview(descriptionLabel)
        addSubview(infoLabel)
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            characterDetailImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            characterDetailImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: ConstraintManager.stackViewPadding),
            characterDetailImageView.heightAnchor.constraint(equalToConstant: ConstraintManager.characterDetailImageHeight),
            characterDetailImageView.widthAnchor.constraint(equalToConstant: ConstraintManager.characterDetailImageWidth),
        
            characterLabelStackView.topAnchor.constraint(equalTo: characterDetailImageView.bottomAnchor, constant: ConstraintManager.stackViewPadding),
            characterLabelStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ConstraintManager.stackViewPadding),
            characterLabelStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -ConstraintManager.stackViewPadding),
            
            descriptionLabel.topAnchor.constraint(equalTo: characterLabelStackView.bottomAnchor, constant: ConstraintManager.descriptionLabelBottomMargin),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ConstraintManager.stackViewPadding),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -ConstraintManager.stackViewPadding),
            
            infoLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: ConstraintManager.descriptionLabelBottomMargin),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ConstraintManager.infoLabelLeading),
            
            tableView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: ConstraintManager.topAnchorConstraint()),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ConstraintManager.leadingAnchorConstraint()),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: ConstraintManager.trailingAnchorConstraint()),
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
