//
//  BlueRoundedButton.swift
//  Jobs
//
//  Created by Renat Murtazin on 21.10.2022.
//

import UIKit

final class BlueRoundedButton: UIButton {
    
    // MARK: - Private properties
    
    private let title: String
    
    // MARK: - Initializers
    
    init(title: String) {
        self.title = title
        
        super.init(frame: .zero)
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private

private extension BlueRoundedButton {
    
    func setupButton() {
        
        setTitle(title, for: .normal)
        setTitleColor(.systemBackground, for: .normal)
        
        backgroundColor = .systemBlue
        
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        
        layer.cornerRadius = Constant.CornerRadius.Button.blueRounded
        
        sizeToFit()
    }
    
}
