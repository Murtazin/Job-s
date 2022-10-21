//
//  AuthRegisterViewController.swift
//  Jobs
//
//  Created by Renat Murtazin on 17.10.2022.
//

import SnapKit

final class AuthRegisterViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let passwordTFRightViewImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 23, height: 17))
    
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
        let emailTF = UITextField()
        
        emailTF.placeholder = "Почта"
        
        emailTF.layer.cornerRadius = 10
        emailTF.layer.borderWidth = 1.0
        
        emailTF.borderStyle = .roundedRect
        
        emailTF.textColor = .label
        emailTF.tintColor = .systemGray3
        emailTF.backgroundColor = .systemBackground
        emailTF.layer.borderColor = UIColor.systemGray5.cgColor
        
        let leftViewImageView = UIImageView(frame: CGRect(x: 15, y: 0, width: 15, height: 15))
        let leftViewImage =  UIImage(systemName: "envelope")
        leftViewImageView.image = leftViewImage
        leftViewImageView.contentMode = .scaleAspectFill
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 33, height: 15))
        leftView.addSubview(leftViewImageView)
        
        emailTF.leftView = leftView
        emailTF.leftViewMode = .always
        
        emailTF.clipsToBounds = true
        emailTF.delegate = self
        return emailTF
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordTF = UITextField()
        
        passwordTF.placeholder = "Пароль"
        
        passwordTF.layer.cornerRadius = 10
        passwordTF.layer.borderWidth = 1.0
        
        passwordTF.borderStyle = .roundedRect
        
        passwordTF.textColor = .label
        passwordTF.tintColor = .systemGray3
        passwordTF.backgroundColor = .systemBackground
        passwordTF.layer.borderColor = UIColor.systemGray5.cgColor
    
        let leftViewImageView = UIImageView(frame: CGRect(x: 13, y: 0, width: 20, height: 15))
        let leftViewImage = UIImage(systemName: "lock")
        leftViewImageView.image = leftViewImage
        leftViewImageView.contentMode = .scaleAspectFill
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 33, height: 15))
        leftView.addSubview(leftViewImageView)
        
        passwordTF.leftView = leftView
        passwordTF.leftViewMode = .always
        
        let rightViewButton = UIButton(type: .custom)
        rightViewButton.frame = CGRect(x: 0, y: 0, width: 23, height: 17)
        rightViewButton.addTarget(self, action: #selector(showHidePasswordHandler), for: .touchUpInside)
        
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 33, height: 17))
        rightView.addSubview(passwordTFRightViewImageView)
        rightView.addSubview(rightViewButton)
        
        passwordTF.rightView = rightView
        passwordTF.rightViewMode = .always
        
        passwordTF.clipsToBounds = true
        passwordTF.delegate = self
        return passwordTF
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
        
        passwordTFRightViewImageView.image = SystemImage.hidePasswordImage
    
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
    }
    
    // MARK: - Objc
    
    @objc func registerButtonHandler(sender: UIButton) {
        didSendEventClosure?(.login)
    }
    
    @objc func showHidePasswordHandler(sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
        passwordTFRightViewImageView.image = passwordTextField.isSecureTextEntry ? SystemImage.showPasswordImage : SystemImage.hidePasswordImage
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
        case login
    }
}
