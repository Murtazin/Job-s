//
//  ContinueWithView.swift
//  Jobs
//
//  Created by Renat Murtazin on 23.10.2022.
//

import UIKit

final class ContinueWithView: UIView {
    
    // MARK: - UI
    
    private lazy var leftLineView: UIView = {
        let leftLineView = UIView()
        leftLineView.backgroundColor = .systemGray3
        return leftLineView
    }()
    
    private lazy var rightLineView: UIView = {
        let rightLineView = UIView()
        rightLineView.backgroundColor = .systemGray3
        return rightLineView
    }()
    
    private lazy var continueWithLabel: UILabel = {
        let continueWithLabel = UILabel()
        continueWithLabel.text = "или продолжить с"
        continueWithLabel.textColor = .systemGray
        continueWithLabel.font = .systemFont(ofSize: 15)
        return continueWithLabel
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
        
        addSubview(leftLineView)
        addSubview(continueWithLabel)
        addSubview(rightLineView)
        
        leftLineView.snp.makeConstraints {
            $0.centerY.leading.equalToSuperview()
            $0.height.equalTo(1)
            $0.width.equalTo(95)
        }
        
        continueWithLabel.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
        }
        
        rightLineView.snp.makeConstraints {
            $0.centerY.trailing.equalToSuperview()
            $0.height.equalTo(1)
            $0.width.equalTo(95)
        }
    }
}
