//
//  BuilderBasedViewController.swift
//  
//
//  Created by Dossymkhan Zhulamanov on 27.06.2023.
//

import UIKit

public final class BuilderBasedViewController: UIViewController {
    // MARK: Init
    convenience init(@CustomViewBuilder viewElements: () -> ([UIView])) {
        self.init()
        viewElements().forEach {
            mainStackView.addArrangedSubview($0)
        }
    }
    
    private init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Subviews
    private(set) var mainStackView = UIStackView()
        .set(\.axis, to: .vertical)
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        [mainStackView].forEach(view.addSubview)
        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
