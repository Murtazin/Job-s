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
        imageView.image = Constant.Image.Internal.logo
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Муртазин Ренат"
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private lazy var positionLabel: UILabel = {
        let label = UILabel()
        label.text = "iOS developer"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    private lazy var editProfileButton: UIButton = {
        let button = UIButton()
        let configuration = Constant.SymbolConfiguration.pointSize22
        let imageName = Constant.SystemImageName.editInfo
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        button.setImage(image, for: .normal)
        return button
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
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
        addSubview(lineView)
        
        profileImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16.HAdapted)
            $0.centerY.equalToSuperview()
            $0.size.equalTo([Constant.Width.ImageView.profile, Constant.Height.ImageView.profile].HResized)
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
        
        let lineViewWidth: CGFloat = Constant.Width.Shared.screen

        lineView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.size.equalTo([Int(lineViewWidth), Constant.Height.View.line].HResized)
        }
    }
    
    // MARK: - Objc
    
    @objc func editProfileButtonHandler(sender: UIButton) {
        delegate?.editProfileHandler()
    }
}
