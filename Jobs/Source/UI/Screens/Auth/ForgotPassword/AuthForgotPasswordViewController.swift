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
    
    private lazy var enterEmailAddressLabel: UILabel = {
        let enterEmailAddressLabel = UILabel()
        enterEmailAddressLabel.text = "Введите адрес электронной почты, привязанный к аккаунту"
        enterEmailAddressLabel.numberOfLines = 2
        enterEmailAddressLabel.textColor = .label
        enterEmailAddressLabel.font = UIFont.systemFont(ofSize: 14)
        enterEmailAddressLabel.textAlignment = .center
        return enterEmailAddressLabel
    }()
    
    private lazy var emailTextField: AuthTextField = {
        let leftViewImage = SystemImage.emailTFLeftViewImage
        let emailTF = AuthTextField(leftViewImage: leftViewImage, tfPlaceholder: "Почта")
        emailTF.delegate = self
        return emailTF
    }()
    
    private lazy var continueButton = BlueRoundedButton(title: "Продолжить")
    
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
        view.addSubview(enterEmailAddressLabel)
        view.addSubview(emailTextField)
        view.addSubview(continueButton)
        
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(45)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(Constant.logoImageViewWidthHeight)
        }
        
        accessRecoveryLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView).inset(150)
            $0.centerX.equalToSuperview()
        }
        
        enterEmailAddressLabel.snp.makeConstraints {
            $0.top.equalTo(accessRecoveryLabel).inset(75)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(enterEmailAddressLabel).inset(75)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(Constant.authTextFieldHeight)
        }
        
        continueButton.snp.makeConstraints {
            $0.top.equalTo(emailTextField).inset(75)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(Constant.blueRoundedButtonHeight)
            $0.width.equalTo(Constant.blueRoundedButtonWidth)
        }
    }
}

// MARK: - UITextFieldDelegate

extension AuthForgotPasswordViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.systemBlue.cgColor
        textField.tintColor = .systemBlue
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.systemGray5.cgColor
        textField.tintColor = .systemGray3
    }
}
