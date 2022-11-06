//
//  AuthRegisterViewController.swift
//  Jobs
//
//  Created by Renat Murtazin on 17.10.2022.
//

import SnapKit

final class AuthRegisterViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let externalAuthButtons: [ExternalAuthButton] = [
        ExternalAuthButton(image: #imageLiteral(resourceName: "logo-icon"), selectedIndex: 0),
        ExternalAuthButton(image: #imageLiteral(resourceName: "logo-icon"), selectedIndex: 1),
        ExternalAuthButton(image: #imageLiteral(resourceName: "logo-icon"), selectedIndex: 2)
    ]
    
    private var eventClosure: ((AuthRegisterViewController.Event) -> Void)?
    
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
    
    private lazy var emailTextField: AuthTextField = {
        let leftViewImage = SystemImage.emailTFLeftViewImage
        let emailTextField = AuthTextField(leftViewImage: leftViewImage, tfPlaceholder: "Почта")
        emailTextField.tag = 0
        emailTextField.delegate = self
        return emailTextField
    }()
    
    private lazy var passwordTextField: AuthTextField = {
        let leftViewImage = SystemImage.passwordTFLeftViewImage
        let rightViewImage = SystemImage.hidePasswordImage
        let passwordTextField = AuthTextField(leftViewImage: leftViewImage, rightViewImage: rightViewImage, tfPlaceholder: "Пароль")
        passwordTextField.tag = 1
        passwordTextField.delegate = self
        return passwordTextField
    }()
    
    private lazy var registerButton = BlueRoundedButton(title: "Регистрация")
    
    private lazy var continueWithView = ContinueWithView()
    
    private lazy var externalAuthButtonsStackView: UIStackView = {
        let extAuthButtonsStackView = UIStackView(arrangedSubviews: externalAuthButtons)
        extAuthButtonsStackView.alignment = .center
        extAuthButtonsStackView.axis = .horizontal
        extAuthButtonsStackView.spacing = 15.HAdapted
        extAuthButtonsStackView.distribution = .equalSpacing
        return extAuthButtonsStackView
    }()
    
    private lazy var accountExistView = AuthBottomReferenceView(labelText: "Уже есть аккаунт?", buttonTitle: "Войти")
    
    // MARK: - Initializers
    
    init(eventClosure: ((AuthRegisterViewController.Event) -> Void)? = nil) {
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

private extension AuthRegisterViewController {
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(logoImageView)
        view.addSubview(createAccountLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(registerButton)
        view.addSubview(continueWithView)
        view.addSubview(externalAuthButtonsStackView)
        view.addSubview(accountExistView)
        
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(10.VAdapted)
            $0.centerX.equalToSuperview()
            $0.size.equalTo([Constant.logoImageViewWidthHeight, Constant.logoImageViewWidthHeight].HResized)
        }
        
        createAccountLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView).inset(150.VAdapted)
            $0.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(createAccountLabel).inset(70.VAdapted)
            $0.leading.trailing.equalToSuperview().inset(24.HAdapted)
            $0.height.equalTo(Constant.authTextFieldHeight.VAdapted)
        }

        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(16.VAdapted)
            $0.leading.trailing.equalToSuperview().inset(24.HAdapted)
            $0.height.equalTo(Constant.authTextFieldHeight.VAdapted)
        }

        registerButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(24.VAdapted)
            $0.centerX.equalToSuperview()
            $0.size.equalTo([Constant.blueRoundedButtonWidth, Constant.blueRoundedButtonHeight].HResized)
        }
        
        registerButton.addTarget(self, action: #selector(registerButtonHandler), for: .touchUpInside)
        
        continueWithView.snp.makeConstraints {
            $0.top.equalTo(registerButton.snp.bottom).offset(30.VAdapted)
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
            $0.top.equalTo(continueWithView.snp.bottom).offset(30.VAdapted)
            $0.leading.trailing.equalToSuperview().inset(50.HAdapted)
        }
        
        accountExistView.loginDelegate = self
        
        accountExistView.snp.makeConstraints {
            $0.top.equalTo(externalAuthButtonsStackView.snp.bottom).offset(30.VAdapted)
            $0.centerX.equalToSuperview()
            $0.size.equalTo([Constant.authSmallBlueButtonWidth, Constant.authSmallBlueButtonHeight].HResized)
        }
    }
    
    // MARK: - Objc
    
    @objc func registerButtonHandler(sender: UIButton) {
        eventClosure?(.register)
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

extension AuthRegisterViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        if let nextTextField = view.viewWithTag(textField.tag + 1) {
            nextTextField.becomeFirstResponder()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.systemBlue.cgColor
        textField.tintColor = .systemBlue
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.systemGray5.cgColor
        textField.tintColor = .systemGray3
    }
}

// MARK: - IAuthBottomCreateAccountButtonDelegate

extension AuthRegisterViewController: IAuthBottomLoginButtonDelegate {
    func loginButtonHandler() {
        eventClosure?(.login)
    }
}

// MARK: - Event

extension AuthRegisterViewController {
    enum Event {
        case register
        case login
    }
}
