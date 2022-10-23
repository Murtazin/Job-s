//
//  AuthRegisterViewController.swift
//  Jobs
//
//  Created by Renat Murtazin on 17.10.2022.
//

import SnapKit

final class AuthLoginViewController: UIViewController {
    
    // MARK: - Private properties
    
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
    
    private lazy var emailTextField: AuthTextField = {
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
    
    private lazy var forgotPasswordButton: UIButton = {
        let forgotPasswordButton = UIButton()
        forgotPasswordButton.setTitle("Забыли пароль?", for: .normal)
        forgotPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        forgotPasswordButton.setTitleColor(.systemBlue, for: .normal)
        forgotPasswordButton.sizeToFit()
        return forgotPasswordButton
    }()
    
    private lazy var loginButton = BlueRoundedButton(title: "Войти")
    
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
        
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(45)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(Constant.logoImageViewWidthHeight)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView).inset(150)
            $0.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(welcomeLabel).inset(70)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(Constant.authTextFieldHeight)
        }

        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField).inset(55)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(Constant.authTextFieldHeight)
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
            $0.height.equalTo(Constant.blueRoundedButtonHeight)
            $0.width.equalTo(Constant.blueRoundedButtonWidth)
        }
    }
    
    // MARK: - Objc
    
    @objc func loginButtonHandler(sender: UIButton) {
        didSendEventClosure?(.login)
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
