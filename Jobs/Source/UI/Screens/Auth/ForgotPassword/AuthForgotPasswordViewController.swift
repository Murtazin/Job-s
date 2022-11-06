//
//  AuthForgotPasswordViewController.swift
//  Jobs
//
//  Created by Renat Murtazin on 21.10.2022.
//

import UIKit

final class AuthForgotPasswordViewController: UIViewController {
    
    // MARK: - Private properties
    
    private var eventClosure: ((AuthForgotPasswordViewController.Event) -> Void)?
    
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
    
    // MARK: - Initializers
    
    init(eventClosure: ((AuthForgotPasswordViewController.Event) -> Void)? = nil) {
        self.eventClosure = eventClosure
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(45.VAdapted)
            $0.centerX.equalToSuperview()
            $0.size.equalTo([Constant.logoImageViewWidthHeight, Constant.logoImageViewWidthHeight].HResized)
        }
        
        accessRecoveryLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView).inset(150.VAdapted)
            $0.centerX.equalToSuperview()
        }
        
        enterEmailAddressLabel.snp.makeConstraints {
            $0.top.equalTo(accessRecoveryLabel).inset(75.VAdapted)
            $0.leading.trailing.equalToSuperview().inset(16.HAdapted)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(enterEmailAddressLabel).inset(75.VAdapted)
            $0.leading.trailing.equalToSuperview().inset(24.HAdapted)
            $0.height.equalTo(Constant.authTextFieldHeight.VAdapted)
        }
        
        continueButton.addTarget(self, action: #selector(continueButtonHandler), for: .touchUpInside)
        
        continueButton.snp.makeConstraints {
            $0.top.equalTo(emailTextField).inset(75.VAdapted)
            $0.centerX.equalToSuperview()
            $0.size.equalTo([Constant.blueRoundedButtonWidth, Constant.blueRoundedButtonHeight].HResized)
        }
    }
    
    // MARK: - Objc
    
    @objc func continueButtonHandler(sender: UIButton) {
        eventClosure?(.forgotPassword)
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

// MARK: - Event

extension AuthForgotPasswordViewController {
    enum Event {
        case forgotPassword
    }
}
