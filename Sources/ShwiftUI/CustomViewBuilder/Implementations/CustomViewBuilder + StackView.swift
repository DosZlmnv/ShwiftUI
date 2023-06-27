//
//  CustomViewBuilder + StackView.swift
//  
//
//  Created by Dossymkhan Zhulamanov on 27.06.2023.
//

import UIKit

public extension UIStackView {
    @discardableResult
    convenience init(@CustomViewBuilder views: () -> ([UIView])) {
        self.init(arrangedSubviews: views())
    }
    
    @discardableResult
    func setMargins(_ value: UIEdgeInsets) -> Self {
        self.layoutMargins = value
        self.isLayoutMarginsRelativeArrangement = true
        return self
    }
}

