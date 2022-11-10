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
        let imageView = UIImageView()
        imageView.image = Constant.Image.Internal.logo
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var accessRecoveryLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.LabelText.accessRecovery
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
        return label
    }()
    
    private lazy var enterEmailAddressLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.LabelText.enterEmailAddress
        label.textColor = .label
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var emailTextField: GrayBorderedTextField = {
        let leftViewImage = Constant.Image.System.mailLeftViewImage
        let textField = GrayBorderedTextField(leftViewImage: leftViewImage, tfPlaceholder: Constant.TextFieldPlaceholder.mail)
        return textField
    }()
    
    private lazy var continueButton = BlueRoundedButton(title: Constant.ButtonTitle.proceed)
    
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
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(64.VAdapted)
            $0.centerX.equalToSuperview()
            $0.size.equalTo([Constant.Width.ImageView.logo, Constant.Height.ImageView.logo].HResized)
        }
        
        accessRecoveryLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(32.VAdapted)
            $0.centerX.equalToSuperview()
        }
        
        enterEmailAddressLabel.snp.makeConstraints {
            $0.top.equalTo(accessRecoveryLabel.snp.bottom).offset(32.VAdapted)
            $0.centerX.equalToSuperview()
        }
        
        let emailTextFieldWidth: CGFloat = view.frame.width - 64
        
        emailTextField.delegate = self
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(enterEmailAddressLabel.snp.bottom).offset(32.VAdapted)
            $0.centerX.equalToSuperview()
            $0.size.equalTo([Int(emailTextFieldWidth), Constant.Height.TextField.grayBordered].HResized)
        }
        
        continueButton.addTarget(self, action: #selector(continueButtonHandler), for: .touchUpInside)
        
        continueButton.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(32.VAdapted)
            $0.centerX.equalToSuperview()
            $0.size.equalTo([Constant.Width.Button.blueRounded, Constant.Height.Button.blueRounded].HResized)
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
        textField.layer.borderColor = UIColor.systemGray6.cgColor
        textField.tintColor = .systemGray4
    }
}

// MARK: - Event

extension AuthForgotPasswordViewController {
    enum Event {
        case forgotPassword
    }
}
