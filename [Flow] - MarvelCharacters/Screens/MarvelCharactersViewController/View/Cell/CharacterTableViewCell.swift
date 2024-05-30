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
        view.textAlignment = .left
        view.textColor = .text
        view.font = FontManager.marvelRegularFont(ofSize: 15)
        view.numberOfLines = 1
        return view
    }()
    
    private let characterImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.shadowColor = UIColor.red.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 4
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.borderWidth = 0.3
        return view
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [characterImage, characterName])
        view.axis = .horizontal
        view.distribution = .fill
        view.alignment = .fill
        view.spacing = 5
        view.translatesAutoresizingMaskIntoConstraints = false
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
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(horizontalStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            horizontalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            horizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            horizontalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            characterImage.widthAnchor.constraint(equalToConstant: 60),
            characterImage.heightAnchor.constraint(equalToConstant: 60)
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
