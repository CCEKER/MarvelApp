//
//  CharacterDetailTableViewCell.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 29.05.2024.
//

import UIKit

class CharacterDetailTableViewCell: UITableViewCell {
    
    private let comicLabel: UILabel = {
        let view = UILabel()
        view.font = FontManager.marvelRegularFont(ofSize: 13)
        view.textColor = .gray
        view.numberOfLines = 0
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
        contentView.addSubview(comicLabel)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            comicLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: ConstraintManager.defaultPadding),
            comicLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstraintManager.defaultPadding),
            comicLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -ConstraintManager.defaultPadding)
        ])
    }
    
    func reloadWith(_ comicsItem: ComicsItem) {
        comicLabel.text = comicsItem.name
    }
}
