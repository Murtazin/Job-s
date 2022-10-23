//
//  AuthRegisterViewController.swift
//  Jobs
//
//  Created by Renat Murtazin on 17.10.2022.
//

import SnapKit

final class AuthLoginViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let externalAuthButtons: [ExternalAuthButton] = [
        ExternalAuthButton(image: #imageLiteral(resourceName: "logo-icon"), selectedIndex: 0),
        ExternalAuthButton(image: #imageLiteral(resourceName: "logo-icon"), selectedIndex: 1),
        ExternalAuthButton(image: #imageLiteral(resourceName: "logo-icon"), selectedIndex: 2)
    ]
    
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
    
    private lazy var continueWithView = ContinueWithView()
    
    private lazy var externalAuthButtonsStackView: UIStackView = {
        let extAuthButtonsStackView = UIStackView(arrangedSubviews: externalAuthButtons)
        extAuthButtonsStackView.alignment = .center
        extAuthButtonsStackView.axis = .horizontal
        extAuthButtonsStackView.spacing = 15
        extAuthButtonsStackView.distribution = .equalSpacing
        return extAuthButtonsStackView
    }()
    
    private lazy var dontHaveAnAccountView = AuthBottomReferenceView(labelText: "Еще нет аккаунта?", buttonTitle: "Создать")
    
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
        view.addSubview(continueWithView)
        view.addSubview(externalAuthButtonsStackView)
        view.addSubview(dontHaveAnAccountView)
        
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(10.VAdapted)
            $0.centerX.equalToSuperview()
            $0.size.equalTo([Constant.logoImageViewWidthHeight, Constant.logoImageViewWidthHeight].HResized)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView).inset(150.VAdapted)
            $0.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(welcomeLabel).inset(70.VAdapted)
            $0.leading.trailing.equalToSuperview().inset(24.HAdapted)
            $0.height.equalTo(Constant.authTextFieldHeight.VAdapted)
        }

        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField).inset(55.VAdapted)
            $0.leading.trailing.equalToSuperview().inset(24.HAdapted)
            $0.height.equalTo(Constant.authTextFieldHeight.VAdapted)
        }
        
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonHandler), for: .touchUpInside)
        
        forgotPasswordButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField).inset(60.VAdapted)
            $0.centerX.equalToSuperview()
            $0.size.equalTo([Constant.forgotPasswordButtonWidth, Constant.forgotPasswordButtonHeight].HResized)
        }

        loginButton.addTarget(self, action: #selector(loginButtonHandler), for: .touchUpInside)
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(forgotPasswordButton).inset(30.VAdapted)
            $0.centerX.equalToSuperview()
            $0.size.equalTo([Constant.blueRoundedButtonWidth, Constant.blueRoundedButtonHeight].HResized)
        }
        
        continueWithView.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(30.VAdapted)
            $0.leading.trailing.equalToSuperview().inset(16.HAdapted)
            $0.height.equalTo(Constant.continueWithViewHeight.VAdapted)
        }
        
        externalAuthButtons.forEach { button in
            button.snp.makeConstraints {
                $0.size.equalTo([Constant.externalAuthButtonWidth, Constant.externalAuthButtonHeight].HResized)
            }
            button.addTarget(self, action: #selector(externalAuthButtonHandler), for: .touchUpInside)
        }
        
        externalAuthButtonsStackView.snp.makeConstraints {
            $0.top.equalTo(continueWithView.snp.bottom).offset(20.VAdapted)
            $0.leading.trailing.equalToSuperview().inset(50.HAdapted)
        }
        
        dontHaveAnAccountView.caDelegate = self
        
        dontHaveAnAccountView.snp.makeConstraints {
            $0.top.equalTo(externalAuthButtonsStackView.snp.bottom).offset(20.VAdapted)
            $0.centerX.equalToSuperview()
            $0.size.equalTo([Constant.authSmallBlueButtonWidth, Constant.authSmallBlueButtonHeight].HResized)
        }
    }
    
    // MARK: - Objc
    
    @objc func loginButtonHandler(sender: UIButton) {
        didSendEventClosure?(.login)
    }
    
    @objc func forgotPasswordButtonHandler(sender: UIButton) {
        didSendEventClosure?(.forgotPassword)
    }
    
    @objc func externalAuthButtonHandler(sender: UIButton) {
        switch sender.tag {
        case 0:
            print("Vk")
        case 1:
            print("Google")
        case 2:
            print("Apple")
        default:
            break
        }
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

// MARK: - IAuthBottomLoginButtonDelegate

extension AuthLoginViewController: IAuthBottomCreateAccountButtonDelegate {
    func createAccountButtonHandler() {
        didSendEventClosure?(.createAccount)
    }
}

// MARK: - Event

extension AuthLoginViewController {
    enum Event {
        case createAccount
        case login
        case forgotPassword
    }
}
