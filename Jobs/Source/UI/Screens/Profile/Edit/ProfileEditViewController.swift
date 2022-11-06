//
//  ProfileEditViewController.swift
//  Jobs
//
//  Created by Renat Murtazin on 06.11.2022.
//

import UIKit

final class ProfileEditViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "logo-icon")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var changeProfileImageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Выбрать новое фото", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.sizeToFit()
        return button
    }()
    
    private lazy var firstNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя"
        label.textColor = .label
        return label
    }()
    
    private lazy var firstNameTextField = AuthTextField(tfPlaceholder: "Имя")
    
    private lazy var lastNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Фамилия"
        label.textColor = .label
        return label
    }()
    
    private lazy var lastNameTextField = AuthTextField(tfPlaceholder: "Фамилия")
    
    private lazy var positionLabel: UILabel = {
        let label = UILabel()
        label.text = "Должность"
        label.textColor = .label
        return label
    }()
    
    private lazy var positionTextField = AuthTextField(tfPlaceholder: "Должность")
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
}

// MARK: - Private

private extension ProfileEditViewController {
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(profileImageView)
        view.addSubview(changeProfileImageButton)
        view.addSubview(firstNameLabel)
        view.addSubview(firstNameTextField)
        view.addSubview(lastNameLabel)
        view.addSubview(lastNameTextField)
        view.addSubview(positionLabel)
        view.addSubview(positionTextField)
        
        profileImageView.layer.cornerRadius = view.frame.width / 2
        
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(16.VAdapted)
            $0.centerX.equalToSuperview()
            $0.size.equalTo([100, 100].HResized)
        }
        
        changeProfileImageButton.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(8.VAdapted)
            $0.centerX.equalToSuperview()
        }
        
        firstNameLabel.snp.makeConstraints {
            $0.top.equalTo(changeProfileImageButton.snp.bottom).offset(16.VAdapted)
            $0.leading.equalToSuperview().inset(16.HAdapted)
        }
        
        firstNameTextField.snp.makeConstraints {
            $0.top.equalTo(firstNameLabel.snp.bottom).offset(8.VAdapted)
            $0.leading.trailing.equalToSuperview().inset(16.HAdapted)
            $0.height.equalTo(Constant.authTextFieldHeight.VAdapted)
        }
        
        lastNameLabel.snp.makeConstraints {
            $0.top.equalTo(firstNameTextField.snp.bottom).offset(16.VAdapted)
            $0.leading.equalToSuperview().inset(16.HAdapted)
        }
        
        lastNameTextField.snp.makeConstraints {
            $0.top.equalTo(lastNameLabel.snp.bottom).offset(8.VAdapted)
            $0.leading.trailing.equalToSuperview().inset(16.HAdapted)
            $0.height.equalTo(Constant.authTextFieldHeight.VAdapted)
        }
        
        positionLabel.snp.makeConstraints {
            $0.top.equalTo(lastNameTextField.snp.bottom).offset(16.VAdapted)
            $0.leading.equalToSuperview().inset(16.HAdapted)
        }
        
        positionTextField.snp.makeConstraints {
            $0.top.equalTo(positionLabel.snp.bottom).offset(8.VAdapted)
            $0.leading.trailing.equalToSuperview().inset(16.HAdapted)
            $0.height.equalTo(Constant.authTextFieldHeight.VAdapted)
        }
    }
}
