//
//  TagView.swift
//  Jobs
//
//  Created by Renat Murtazin on 29.10.2022.
//

import UIKit

final class TagView: UIButton {
    
    // MARK: - Private properties
    
    private var title: String
    
    // MARK: - Initializers
    
    init(title: String) {
        self.title = title
        
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private

private extension TagView {
    
    func setupUI() {
        
        setTitle(title, for: .normal)
        setTitleColor(.label, for: .normal)
        
        backgroundColor = .systemBackground
        
        layer.cornerRadius = 15
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.systemGray5.cgColor
        
        contentEdgeInsets = .init(top: 4, left: 16, bottom: 4, right: 16)
        
        sizeToFit()
    }
}
