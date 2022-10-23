//
//  ExternalAuthButton.swift
//  Jobs
//
//  Created by Renat Murtazin on 23.10.2022.
//

import UIKit

final class ExternalAuthButton: UIButton {
    
    // MARK: - Private properties
    
    private let image: UIImage
    
    private let selectedIndex: Int
    
    // MARK: - Initializers
    
    init(image: UIImage, selectedIndex: Int) {
        self.image = image
        self.selectedIndex = selectedIndex
        
        super.init(frame: .zero)
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private

private extension ExternalAuthButton {
    
    func setupButton() {
        backgroundColor = .systemBackground
        
        tag = selectedIndex
        
        layer.cornerRadius = 10
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.systemGray3.cgColor
        
        imageView?.contentMode = .scaleAspectFit
        
        setImage(image, for: .normal)
    }
}
