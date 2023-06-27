//
//  ViewBuilderBasedTableViewCell.swift
//  
//
//  Created by Dossymkhan Zhulamanov on 27.06.2023.
//

import UIKit

public final class ViewBuilderBasedTableViewCell: UITableViewCell {
    // MARK: Init
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Subviews
    private let mainStackView = UIStackView()
        .set(\.axis, to: .vertical)
    
    // MARK: Lifecycle
     func setupViews() {
        [mainStackView].forEach(contentView.addSubview)
        updateConstraints()
    }
    
    public override func updateConstraints() {
        super.updateConstraints()
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    @discardableResult
    func configure(@CustomViewBuilder viewElements: () -> ([UIView])) -> UIView {
        viewElements().forEach {
            mainStackView.addArrangedSubview($0)
        }
        return contentView
    }
    
    @discardableResult
    func configureStack(@CustomViewBuilder viewElements: () -> ([UIView])) -> UIStackView {
        viewElements().forEach {
            mainStackView.addArrangedSubview($0)
        }
        return mainStackView
    }
}
