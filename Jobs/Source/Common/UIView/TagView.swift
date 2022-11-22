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
        
        titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
        
        backgroundColor = .systemBackground
        
        layer.cornerRadius = Constant.CornerRadius.View.tag
        layer.borderWidth = Constant.BorderWidth.View.tag
        layer.borderColor = UIColor.systemGray5.cgColor
        
        contentEdgeInsets = .init(top: 4.VAdapted, left: 16.HAdapted, bottom: 4.VAdapted, right: 16.HAdapted)
        
        sizeToFit()
    }
}
