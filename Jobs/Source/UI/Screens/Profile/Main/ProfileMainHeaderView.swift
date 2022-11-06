//
//  ProfileMainHeaderView.swift
//  Jobs
//
//  Created by Renat Murtazin on 01.11.2022.
//

import UIKit

protocol IProfileMainHeaderViewDelegate: AnyObject {
    func editProfileHandler()
}

final class ProfileMainHeaderView: UIView {
    
    weak var delegate: IProfileMainHeaderViewDelegate?
    
    // MARK: - UI
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "logo-icon")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Муртазин Ренат"
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private lazy var positionLabel: UILabel = {
        let label = UILabel()
        label.text = "iOS dev"
        label.textColor = .label
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private lazy var editProfileButton: UIButton = {
        let button = UIButton()
        let configuration = UIImage.SymbolConfiguration(pointSize: 22)
        let image = UIImage(systemName: "pencil", withConfiguration: configuration)
        button.setImage(image, for: .normal)
        return button
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private

private extension ProfileMainHeaderView {
    
    func setupUI() {
        backgroundColor = .systemBackground
        
        addSubview(profileImageView)
        addSubview(fullNameLabel)
        addSubview(positionLabel)
        addSubview(editProfileButton)
        
        profileImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.size.equalTo([70, 70].HResized)
            $0.leading.equalToSuperview().inset(16.HAdapted)
        }
        
        fullNameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.top).offset(8.VAdapted)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16.HAdapted)
        }
        
        positionLabel.snp.makeConstraints {
            $0.top.equalTo(fullNameLabel.snp.bottom).offset(12.VAdapted)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16.HAdapted)
        }
        
        editProfileButton.addTarget(self, action: #selector(editProfileButtonHandler), for: .touchUpInside)
        
        editProfileButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16.HAdapted)
        }
    }
    
    // MARK: - Objc
    
    @objc func editProfileButtonHandler(sender: UIButton) {
        delegate?.editProfileHandler()
    }
}
