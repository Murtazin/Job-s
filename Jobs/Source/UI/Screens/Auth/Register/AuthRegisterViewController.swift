//
//  AuthRegisterViewController.swift
//  Jobs
//
//  Created by Renat Murtazin on 17.10.2022.
//

import SnapKit

final class AuthRegisterViewController: UIViewController {
    
    // MARK: - Private properties
    
    private var didSendEventClosure: ((AuthRegisterViewController.Event) -> Void)?
    
    // MARK: - UI
    
    private lazy var logoImageView: UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.image = #imageLiteral(resourceName: "logo-icon")
        return logoImageView
    }()
    
    private lazy var createAccountLabel: UILabel = {
        let createAccountLabel = UILabel()
        createAccountLabel.text = "Создать аккаунт"
        createAccountLabel.textColor = .label
        createAccountLabel.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        return createAccountLabel
    }()
    
    private lazy var emailTextField: UITextField = {
        let leftViewImage = SystemImage.emailTFLeftViewImage
        let emailTextField = AuthTextField(leftViewImage: leftViewImage, tfPlaceholder: "Почта")
        emailTextField.delegate = self
        return emailTextField
    }()
    
    private lazy var passwordTextField: AuthTextField = {
        let leftViewImage = SystemImage.passwordTFLeftViewImage
        let rightViewImage = SystemImage.hidePasswordImage
        let passwordTextField = AuthTextField(leftViewImage: leftViewImage, rightViewImage: rightViewImage, tfPlaceholder: "Пароль")
        passwordTextField.delegate = self
        return passwordTextField
    }()
    
    private lazy var registerButton: UIButton = {
        let registerButton = UIButton()
        registerButton.setTitle("Регистрация", for: .normal)
        registerButton.backgroundColor = .systemBlue
        registerButton.layer.cornerRadius = 23
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        registerButton.setTitleColor(.systemBackground, for: .normal)
        registerButton.sizeToFit()
        return registerButton
    }()
    
    private lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Вход", for: .normal)
        loginButton.backgroundColor = .systemBlue
        loginButton.layer.cornerRadius = 23
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        loginButton.setTitleColor(.systemBackground, for: .normal)
        loginButton.sizeToFit()
        return loginButton
    }()
    
    // MARK: - Initializers
    
    init(didSendEventClosure: ((AuthRegisterViewController.Event) -> Void)? = nil) {
        self.didSendEventClosure = didSendEventClosure
        
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

private extension AuthRegisterViewController {
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(logoImageView)
        view.addSubview(createAccountLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(registerButton)
        view.addSubview(loginButton)
    
        let logoImageViewWidthHeightConstant: CGFloat = 130
        let textFieldHeightConstant: CGFloat = 40
        
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(45)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(logoImageViewWidthHeightConstant)
        }
        
        createAccountLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView).inset(150)
            $0.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(createAccountLabel).inset(70)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(textFieldHeightConstant)
        }

        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField).inset(55)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(textFieldHeightConstant)
        }

        registerButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField).inset(65)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(45)
            $0.width.equalTo(320)
        }
        
        registerButton.addTarget(self, action: #selector(registerButtonHandler), for: .touchUpInside)
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(registerButton).inset(65)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(45)
            $0.width.equalTo(320)
        }
        
        loginButton.addTarget(self, action: #selector(loginButtonHandler), for: .touchUpInside)
    }
    
    // MARK: - Objc
    
    @objc func registerButtonHandler(sender: UIButton) {
        didSendEventClosure?(.register)
    }
    
    @objc func loginButtonHandler(sender: UIButton) {
        didSendEventClosure?(.login)
    }
}

// MARK: - UITextFieldDelegate

extension AuthRegisterViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.systemBlue.cgColor
        textField.tintColor = .systemBlue
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.systemGray5.cgColor
        textField.tintColor = .systemGray3
    }
}

#warning("TODO: Add more events")

extension AuthRegisterViewController {
    enum Event {
        case register
        case login
    }
}
