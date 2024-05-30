//
//  ConstraintManager.swift
//  MarvelApp
//
//  Created by Cagatay Ceker on 30.05.2024.
//

import Foundation

struct ConstraintManager {
    
    static let defaultPadding: CGFloat = 10
    static let defaultMargin: CGFloat = 12
    
    static let characterImageSize: CGFloat = 60
    static let characterDetailImageWidth: CGFloat = 180
    static let characterDetailImageHeight: CGFloat = 180
    static let infoLabelLeading: CGFloat = 20
    
    static let stackViewPadding: CGFloat = 24
    static let descriptionLabelBottomMargin: CGFloat = 30
    static let tableViewBottomPadding: CGFloat = 12
    
    static func topAnchorConstraint() -> CGFloat {
        return defaultPadding
    }
    
    static func leadingAnchorConstraint() -> CGFloat {
        return defaultMargin
    }
    
    static func trailingAnchorConstraint() -> CGFloat {
        return -defaultMargin
    }
    
    static func bottomAnchorConstraint() -> CGFloat {
        return -defaultPadding
    }
    
    static func labelStackViewTopConstraint() -> CGFloat {
        return characterDetailImageHeight + stackViewPadding
    }
}
