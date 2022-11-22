//
//  ContinueWithView.swift
//  Jobs
//
//  Created by Renat Murtazin on 23.10.2022.
//

import UIKit

final class ContinueWithView: UIView {
    
    // MARK: - UI
    
    private lazy var continueWithLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.LabelText.continueWith
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private

private extension ContinueWithView {
    
    func setupView() {
        backgroundColor = .systemBackground
        
        addSubview(continueWithLabel)
        
        continueWithLabel.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
        }
    }
}
