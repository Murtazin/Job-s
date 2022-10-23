//
//  AuthBottomReferenceView.swift
//  Jobs
//
//  Created by Renat Murtazin on 23.10.2022.
//

import UIKit

final class AuthBottomReferenceView: UIView {
    
    // MARK: - Private properties
    
    private let labelText: String
    
    private let buttonTitle: String
    
    // MARK: - UI
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = labelText
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle(buttonTitle, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(.systemBlue, for: .normal)
        button.sizeToFit()
        return button
    }()
    
    // MARK: - Initializers
    
    init(labelText: String, buttonTitle: String) {
        self.labelText = labelText
        self.buttonTitle = buttonTitle
        
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private

private extension AuthBottomReferenceView {
    
    func setupView() {
        backgroundColor = .systemBackground
        
        addSubview(label)
        addSubview(button)
        
        label.snp.makeConstraints {
            $0.centerY.leading.equalToSuperview()
        }
        
        button.addTarget(self, action: #selector(buttonHandler), for: .touchUpInside)
        
        button.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(label.snp.trailing).offset(5)
            $0.height.equalTo(15)
        }
    }
    
    // MARK: - Objc
    
    @objc func buttonHandler(sender: UIButton) {
        print("Logged in")
    }
}
