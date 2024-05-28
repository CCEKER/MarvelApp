//
//  CharacterTableViewCell.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 28.05.2024.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    private let characterName: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.textColor = .black
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let characterImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.backgroundColor = .clear
        contentView.addSubview(characterName)
        contentView.addSubview(characterImage)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            characterImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            characterImage.widthAnchor.constraint(equalToConstant: 60),
            characterImage.heightAnchor.constraint(equalToConstant: 60),
            characterImage.topAnchor.constraint(greaterThanOrEqualTo: self.contentView.topAnchor, constant: 10),
            characterImage.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -10),
            characterImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            
            characterName.leadingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: 8),
            characterName.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            characterName.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
        ])
    }
    
    func reloadWith(_ viewModel: CharacterViewModel) {
        characterName.text = viewModel.name
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: URL(string: viewModel.imageUrl!)!), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.characterImage.image = image
                }
            }
        }
    }
}
