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
        ExternalAuthButton(image: Constant.Image.Internal.logo, selectedIndex: 0),
        ExternalAuthButton(image: Constant.Image.Internal.logo, selectedIndex: 1),
        ExternalAuthButton(image: Constant.Image.Internal.logo, selectedIndex: 2)
    ]
    
    private var eventClosure: ((AuthLoginViewController.Event) -> Void)?
    
    // MARK: - UI
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constant.Image.Internal.logo
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.LabelText.welcome
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        return label
    }()
    
    private lazy var emailTextField: GrayBorderedTextField = {
        let leftViewImage = Constant.Image.System.mailLeftViewImage
        let textField = GrayBorderedTextField(leftViewImage: leftViewImage, tfPlaceholder: Constant.TextFieldPlaceholder.mail)
        return textField
    }()
    
    private lazy var passwordTextField: GrayBorderedTextField = {
        let leftViewImage = Constant.Image.System.passwordLeftViewImage
        let rightViewImage = Constant.Image.System.hidePasswordImage
        let textField = GrayBorderedTextField(leftViewImage: leftViewImage,
                                              rightViewImage: rightViewImage,
                                              tfPlaceholder: Constant.TextFieldPlaceholder.password)
        return textField
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constant.ButtonTitle.forgotPassword, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        button.sizeToFit()
        return button
    }()
    
    private lazy var loginButton = BlueRoundedButton(title: Constant.ButtonTitle.login)
    
    private lazy var continueWithView = ContinueWithView()
    
    private lazy var externalAuthButtonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: externalAuthButtons)
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = Constant.StackViewSpacing.externalAuthButtons.HAdapted
        return stackView
    }()
    
    private lazy var dontHaveAnAccountView = AuthBottomReferenceView(labelText: Constant.LabelText.dontHaveAnAccount,
                                                                     buttonTitle: Constant.ButtonTitle.create)
    
    // MARK: - Initializers
    
    init(eventClosure: ((AuthLoginViewController.Event) -> Void)? = nil) {
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
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(16.VAdapted)
            $0.centerX.equalToSuperview()
            $0.size.equalTo([Constant.Width.ImageView.logo, Constant.Height.ImageView.logo].HResized)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(24.VAdapted)
            $0.centerX.equalToSuperview()
        }
        
        let textFieldsWidth: CGFloat = view.frame.width - 64
        
        emailTextField.delegate = self
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(24.VAdapted)
            $0.centerX.equalToSuperview()
            $0.size.equalTo([Int(textFieldsWidth), Constant.Height.TextField.grayBordered].HResized)
        }
        
        passwordTextField.delegate = self
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(16.VAdapted)
            $0.centerX.equalToSuperview()
            $0.size.equalTo([Int(textFieldsWidth), Constant.Height.TextField.grayBordered].HResized)
        }
        
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonHandler), for: .touchUpInside)
        
        forgotPasswordButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(16.VAdapted)
            $0.centerX.equalToSuperview()
            $0.size.equalTo([Constant.Width.Button.forgotPassword, Constant.Height.Button.forgotPassword].HResized)
        }
        
        loginButton.addTarget(self, action: #selector(loginButtonHandler), for: .touchUpInside)
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(forgotPasswordButton.snp.bottom).offset(16.VAdapted)
            $0.centerX.equalToSuperview()
            $0.size.equalTo([Constant.Width.Button.blueRounded, Constant.Height.Button.blueRounded].HResized)
        }
        
        let continueWithViewWidth: CGFloat = view.frame.width - 32
        
        continueWithView.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(24.VAdapted)
            $0.centerX.equalToSuperview()
            $0.size.equalTo([Int(continueWithViewWidth), Constant.Height.View.continueWith].HResized)
        }
        
        externalAuthButtons.forEach { button in
            button.addTarget(self, action: #selector(externalAuthButtonHandler), for: .touchUpInside)
            
            button.snp.makeConstraints {
                $0.size.equalTo([Constant.Width.Button.externalAuth, Constant.Height.Button.externalAuth].HResized)
            }
        }
        
        let externalABStackViewWidth: CGFloat = view.frame.width - 100
        
        externalAuthButtonsStackView.snp.makeConstraints {
            $0.top.equalTo(continueWithView.snp.bottom).offset(24.VAdapted)
            $0.centerX.equalToSuperview()
            $0.width.equalTo([Int(externalABStackViewWidth), 0].HResized.width)
        }
        
        dontHaveAnAccountView.caDelegate = self
        
        dontHaveAnAccountView.snp.makeConstraints {
            $0.top.equalTo(externalAuthButtonsStackView.snp.bottom).offset(24.VAdapted)
            $0.centerX.equalToSuperview()
            $0.size.equalTo([Constant.Width.Button.authSmallBlue, Constant.Height.Button.authSmallBlue].HResized)
        }
    }
    
    // MARK: - Objc
    
    @objc func loginButtonHandler(sender: UIButton) {
        eventClosure?(.login)
    }
    
    @objc func forgotPasswordButtonHandler(sender: UIButton) {
        eventClosure?(.forgotPassword)
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
        textField.layer.borderColor = UIColor.systemGray6.cgColor
        textField.tintColor = .systemGray4
    }
}

// MARK: - IAuthBottomLoginButtonDelegate

extension AuthLoginViewController: IAuthBottomCreateAccountButtonDelegate {
    func createAccountButtonHandler() {
        eventClosure?(.createAccount)
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
