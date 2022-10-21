//
//  AuthRegisterViewController.swift
//  Jobs
//
//  Created by Renat Murtazin on 17.10.2022.
//

import SnapKit

final class AuthLoginViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let passwordTFRightViewImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 23, height: 17))
    
    private var didSendEventClosure: ((AuthLoginViewController.Event) -> Void)?
    
    // MARK: - UI
    
    private lazy var logoImageView: UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.image = #imageLiteral(resourceName: "logo-icon")
        return logoImageView
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Добро пожаловать"
        welcomeLabel.textColor = .label
        welcomeLabel.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        return welcomeLabel
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
    
    private lazy var forgotPasswordButton: UIButton = {
        let forgotPasswordButton = UIButton()
        forgotPasswordButton.setTitle("Забыли пароль?", for: .normal)
        forgotPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        forgotPasswordButton.setTitleColor(.systemBlue, for: .normal)
        forgotPasswordButton.sizeToFit()
        return forgotPasswordButton
    }()
    
    private lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Войти", for: .normal)
        loginButton.backgroundColor = .systemBlue
        loginButton.layer.cornerRadius = 23
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        loginButton.setTitleColor(.systemBackground, for: .normal)
        loginButton.sizeToFit()
        return loginButton
    }()
    
    // MARK: - Initializers
    
    init(didSendEventClosure: ((AuthLoginViewController.Event) -> Void)? = nil) {
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

private extension AuthLoginViewController {
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(logoImageView)
        view.addSubview(welcomeLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(forgotPasswordButton)
        view.addSubview(loginButton)
        
        passwordTFRightViewImageView.image = SystemImage.hidePasswordImage
    
        let logoImageViewWidthHeightConstant: CGFloat = 130
        let textFieldHeightConstant: CGFloat = 40
        
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(45)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(logoImageViewWidthHeightConstant)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView).inset(150)
            $0.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(welcomeLabel).inset(70)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(textFieldHeightConstant)
        }

        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField).inset(55)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(textFieldHeightConstant)
        }
        
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonHandler), for: .touchUpInside)
        
        forgotPasswordButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField).inset(60)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(15)
            $0.width.equalTo(170)
        }

        loginButton.addTarget(self, action: #selector(loginButtonHandler), for: .touchUpInside)
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(forgotPasswordButton).inset(35)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(45)
            $0.width.equalTo(320)
        }
    }
    
    // MARK: - Objc
    
    @objc func loginButtonHandler(sender: UIButton) {
        didSendEventClosure?(.login)
    }
    
    @objc func showHidePasswordHandler(sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
        passwordTFRightViewImageView.image = passwordTextField.isSecureTextEntry ? SystemImage.showPasswordImage : SystemImage.hidePasswordImage
    }
    
    @objc func forgotPasswordButtonHandler(sender: UIButton) {
        print("forgot password pressed")
    }
}

// MARK: - UITextFieldDelegate

extension AuthLoginViewController: UITextFieldDelegate {
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

extension AuthLoginViewController {
    enum Event {
        case login
    }
}
