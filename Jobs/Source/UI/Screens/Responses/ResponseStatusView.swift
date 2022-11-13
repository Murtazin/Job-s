//
//  ResponseStatusView.swift
//  Jobs
//
//  Created by Renat Murtazin on 14.11.2022.
//

import UIKit

final class ResponseStatusView: UIView {
    
    // MARK: - UI
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12, weight: .light)
        return label
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal
    
    func configure(status: ResponseStatus) {
        statusLabel.text = status.rawValue
        
        switch status {
        case .viewed, .notViewed:
            statusLabel.textColor = .systemGray
        case .denied:
            statusLabel.textColor = .systemRed
        case .invited:
            statusLabel.textColor = .systemGreen
        }
    }
}

// MARK: - Private

private extension ResponseStatusView {
    
    func setupUI() {
        layer.cornerRadius = Constant.CornerRadius.View.responseStatus
        layer.borderWidth = Constant.BorderWidth.View.responseStatus
        layer.borderColor = UIColor.systemGray5.cgColor
        
        addSubview(statusLabel)
        
        statusLabel.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
        }
    }
    
}
