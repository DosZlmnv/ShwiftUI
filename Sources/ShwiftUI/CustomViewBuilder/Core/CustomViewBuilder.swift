//
//  CustomViewBuilder.swift
//
//
//  Created by Dossymkhan Zhulamanov on 27.06.2023.
//

import UIKit

@resultBuilder
public struct CustomViewBuilder {
    static func buildBlock(_ views: UIView...) -> [UIView] {
        return views
    }
}
