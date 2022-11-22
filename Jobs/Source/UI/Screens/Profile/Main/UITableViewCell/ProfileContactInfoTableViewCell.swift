//
//  ProfileContactInfoTableViewCell.swift
//  Jobs
//
//  Created by Renat Murtazin on 20.11.2022.
//

import UIKit

final class ProfileContactInfoTableViewCell: UITableViewCell {
    
    // MARK: - UI
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    private lazy var locationIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constant.Image.System.locationIcon
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 16, weight: .thin)
        return label
    }()
    
    private lazy var phoneNumberIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constant.Image.System.phoneNumberIcon
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 16, weight: .thin)
        return label
    }()
    
    private lazy var mailAddressIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constant.Image.System.mailAddressIcon
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var mailAddressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 16, weight: .thin)
        return label
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal
    
    func configure(contactInfo: ProfileMainContactInfoModel) {
        locationLabel.text = contactInfo.location
        phoneNumberLabel.text = contactInfo.phoneNumber
        mailAddressLabel.text = contactInfo.mail
    }
}

// MARK: - Private

private extension ProfileContactInfoTableViewCell {
    
    func setupUI() {
        backgroundColor = .systemBackground
        
        contentView.addSubview(containerView)
        
        containerView.layer.cornerRadius = Constant.CornerRadius.View.infoView
        containerView.layer.borderWidth = Constant.BorderWidth.View.infoView
        containerView.layer.borderColor = UIColor.systemGray5.cgColor
        
        containerView.addSubview(locationIconImageView)
        containerView.addSubview(locationLabel)
        containerView.addSubview(phoneNumberIconImageView)
        containerView.addSubview(phoneNumberLabel)
        containerView.addSubview(mailAddressIconImageView)
        containerView.addSubview(mailAddressLabel)
        
        containerView.snp.makeConstraints {
            $0.edges.equalTo(contentView).inset(16.HAdapted)
        }
        
        locationIconImageView.snp.makeConstraints {
            $0.top.leading.equalTo(containerView).inset(16.HAdapted)
            $0.size.equalTo([Constant.Width.ImageView.contactInfoIcon, Constant.Height.ImageView.contactInfoIcon].HResized)
        }
        
        locationLabel.snp.makeConstraints {
            $0.leading.equalTo(locationIconImageView.snp.trailing).offset(16.HAdapted)
            $0.centerY.equalTo(locationIconImageView)
        }
        
        phoneNumberIconImageView.snp.makeConstraints {
            $0.leading.equalTo(containerView).inset(16.HAdapted)
            $0.centerY.equalTo(containerView)
            $0.size.equalTo([Constant.Width.ImageView.contactInfoIcon, Constant.Height.ImageView.contactInfoIcon].HResized)
        }
        
        phoneNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(phoneNumberIconImageView.snp.trailing).offset(16.HAdapted)
            $0.centerY.equalTo(phoneNumberIconImageView)
        }
        
        mailAddressIconImageView.snp.makeConstraints {
            $0.leading.bottom.equalTo(containerView).inset(16.HAdapted)
            $0.size.equalTo([Constant.Width.ImageView.contactInfoIcon, Constant.Height.ImageView.contactInfoIcon].HResized)
        }
        
        mailAddressLabel.snp.makeConstraints {
            $0.leading.equalTo(mailAddressIconImageView.snp.trailing).offset(16.HAdapted)
            $0.centerY.equalTo(mailAddressIconImageView)
        }
    }
}
