//
//  NavigationWordView.swift
//  Jobs
//
//  Created by Renat Murtazin on 22.10.2022.
//

import UIKit

final class NavigationWordView: UIView {
    
    // MARK: - Private properties
    
    private let navigationWord: String
    
    // MARK: - UI
    
    private lazy var navigationWordLabel: UILabel = {
        let navigationWordLabel = UILabel()
        navigationWordLabel.textColor = .label
        navigationWordLabel.font = .systemFont(ofSize: 8)
        return navigationWordLabel
    }()
    
    // MARK: - Initializers
    
    init(navigationWord: String) {
        self.navigationWord = navigationWord
        
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private

private extension NavigationWordView {
    
    func setupView() {
        backgroundColor = .systemBackground
        
        layer.cornerRadius = 5
        layer.borderColor = UIColor.systemGray3.cgColor
        layer.borderWidth = 1.0
        
        navigationWordLabel.text = navigationWord
        
        addSubview(navigationWordLabel)
        
        navigationWordLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
}
