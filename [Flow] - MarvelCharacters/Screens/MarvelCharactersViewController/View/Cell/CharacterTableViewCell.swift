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
        view.textColor = .systemRed
        view.font = UIFont(name: "Roboto", size: 20)
        view.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let characterImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.shadowColor = UIColor.red.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 4
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.borderWidth = 1
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
        contentView.backgroundColor = .black
        contentView.addSubview(characterName)
        contentView.addSubview(characterImage)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            characterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            characterImage.widthAnchor.constraint(equalToConstant: 60),
            characterImage.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 10),
            characterImage.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10),
            characterImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            characterImage.heightAnchor.constraint(equalToConstant: 60),

            characterName.leadingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: 8),
            characterName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            characterName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
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
