//
//  AuthForgotPasswordViewController.swift
//  Jobs
//
//  Created by Renat Murtazin on 21.10.2022.
//

import UIKit

final class AuthForgotPasswordViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var logoImageView: UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.image = #imageLiteral(resourceName: "logo-icon")
        return logoImageView
    }()
    
    private lazy var accessRecoveryLabel: UILabel = {
        let accessRecoveryLabel = UILabel()
        accessRecoveryLabel.text = "Восстановление доступа"
        accessRecoveryLabel.textColor = .label
        accessRecoveryLabel.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
        return accessRecoveryLabel
    }()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

// MARK: - Private

private extension AuthForgotPasswordViewController {
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(logoImageView)
        view.addSubview(accessRecoveryLabel)
        
        let logoImageViewWidthHeightConstant: CGFloat = 130
        
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(45)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(logoImageViewWidthHeightConstant)
        }
        
        accessRecoveryLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView).inset(150)
            $0.centerX.equalToSuperview()
        }
    }
}
