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
        view.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        view.font = UIFont(name: "Roboto", size: 15)
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
        contentView.backgroundColor = .black
        contentView.addSubview(comicLabel)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            comicLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            comicLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            comicLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
    
    func reloadWith(_ comicsItem: ComicsItem) {
        comicLabel.text = comicsItem.name
    }
}
