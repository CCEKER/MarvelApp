//
//  FontManager.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 29.05.2024.
//

import UIKit

struct FontManager {
    static func marvelRegularFont(ofSize size: CGFloat) -> UIFont {
        guard let marvelFont = UIFont(name: "MarvelRegular", size: size) else {
            return UIFont.boldSystemFont(ofSize: size)
        }
        return marvelFont
    }
}
