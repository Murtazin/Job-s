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
        ExternalAuthButton(image: Constant.Image.Internal.logo, selectedIndex: 0),
        ExternalAuthButton(image: Constant.Image.Internal.logo, selectedIndex: 1),
        ExternalAuthButton(image: Constant.Image.Internal.logo, selectedIndex: 2)
    ]
    
    private var eventClosure: ((AuthRegisterViewController.Event) -> Void)?
    
    // MARK: - UI
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constant.Image.Internal.logo
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var createAccountLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.LabelText.createAccount
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 32, weight: .light)
        return label
    }()
    
    private lazy var emailTextField: GrayBorderedTextField = {
        let leftViewImage = Constant.Image.System.mailLeftViewImage
        let textField = GrayBorderedTextField(leftViewImage: leftViewImage,
                                              tfPlaceholder: Constant.TextFieldPlaceholder.mail)
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
    
    private lazy var registerButton = BlueRoundedButton(title: Constant.ButtonTitle.register)
    
    private lazy var continueWithView = ContinueWithView()
    
    private lazy var externalAuthButtonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: externalAuthButtons)
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = Constant.StackViewSpacing.externalAuthButtons.HAdapted
        return stackView
    }()
    
    private lazy var accountExistView = AuthBottomReferenceView(labelText: Constant.LabelText.accountExist,
                                                                buttonTitle: Constant.ButtonTitle.login)
    
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
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(32.VAdapted)
            $0.centerX.equalToSuperview()
            $0.size.equalTo([Constant.Width.ImageView.logo, Constant.Height.ImageView.logo].HResized)
        }
        
        createAccountLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(24.VAdapted)
            $0.centerX.equalToSuperview()
        }
        
        emailTextField.delegate = self
        
        let textFieldsWidth: CGFloat = view.frame.width - 64
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(createAccountLabel.snp.bottom).offset(24.VAdapted)
            $0.centerX.equalToSuperview()
            $0.size.equalTo([Int(textFieldsWidth), Constant.Height.TextField.grayBordered].HResized)
        }
        
        passwordTextField.delegate = self
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(16.VAdapted)
            $0.centerX.equalToSuperview()
            $0.size.equalTo([Int(textFieldsWidth), Constant.Height.TextField.grayBordered].HResized)
        }
        
        registerButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(24.VAdapted)
            $0.centerX.equalToSuperview()
            $0.size.equalTo([Constant.Width.Button.blueRounded, Constant.Height.Button.blueRounded].HResized)
        }
        
        registerButton.addTarget(self, action: #selector(registerButtonHandler), for: .touchUpInside)
        
        let continueWithViewWidth: CGFloat = view.frame.width - 32
        
        continueWithView.snp.makeConstraints {
            $0.top.equalTo(registerButton.snp.bottom).offset(24.VAdapted)
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
        
        accountExistView.loginDelegate = self
        
        accountExistView.snp.makeConstraints {
            $0.top.equalTo(externalAuthButtonsStackView.snp.bottom).offset(24.VAdapted)
            $0.centerX.equalToSuperview()
            $0.size.equalTo([Constant.Width.Button.authSmallBlue, Constant.Height.Button.authSmallBlue].HResized)
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
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.systemBlue.cgColor
        textField.tintColor = .systemBlue
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.systemGray6.cgColor
        textField.tintColor = .systemGray4
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
