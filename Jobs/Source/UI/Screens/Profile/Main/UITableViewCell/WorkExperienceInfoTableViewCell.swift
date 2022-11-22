//
//  ProfileWorkExperienceInfoTableViewCell.swift
//  Jobs
//
//  Created by Renat Murtazin on 21.11.2022.
//

import UIKit

final class WorkExperienceInfoTableViewCell: UITableViewCell {
    
    // MARK: - UI
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    private lazy var companyLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var positionTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private lazy var companyTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 14, weight: .thin)
        return label
    }()
    
    private lazy var experienceDurationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    private lazy var editInfoButton: UIButton = {
        let button = UIButton()
        let configuration = Constant.SymbolConfiguration.pointSize22
        let image = UIImage(systemName: Constant.SystemImageName.editInfo, withConfiguration: configuration)
        button.setImage(image, for: .normal)
        return button
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
    
    func configure(workExperienceInfo: ProfileMainWorkExperienceInfoModel) {
        companyLogoImageView.image = workExperienceInfo.companyLogo
        positionTitleLabel.text = workExperienceInfo.position
        companyTitleLabel.text = workExperienceInfo.companyTitle
        experienceDurationLabel.text = workExperienceInfo.duration
    }
}

// MARK: - Private

private extension WorkExperienceInfoTableViewCell {
    
    func setupUI() {
        backgroundColor = .systemBackground
        
        contentView.addSubview(containerView)
        
        containerView.layer.cornerRadius = Constant.CornerRadius.View.infoView
        containerView.layer.borderWidth = Constant.BorderWidth.View.infoView
        containerView.layer.borderColor = UIColor.systemGray5.cgColor
        
        containerView.addSubview(companyLogoImageView)
        containerView.addSubview(positionTitleLabel)
        containerView.addSubview(companyTitleLabel)
        containerView.addSubview(experienceDurationLabel)
        containerView.addSubview(editInfoButton)
        
        containerView.snp.makeConstraints {
            $0.edges.equalTo(contentView).inset(16.HAdapted)
        }
        
        companyLogoImageView.layer.cornerRadius = Constant.CornerRadius.View.infoView
        companyLogoImageView.layer.borderWidth = Constant.BorderWidth.View.infoView
        companyLogoImageView.layer.borderColor = UIColor.systemGray5.cgColor
        
        companyLogoImageView.snp.makeConstraints {
            $0.leading.equalTo(containerView).inset(16.HAdapted)
            $0.centerY.equalTo(containerView)
            $0.size.equalTo([Constant.Width.ImageView.companyLogo, Constant.Height.ImageView.companyLogo].HResized)
        }
        
        positionTitleLabel.snp.makeConstraints {
            $0.top.equalTo(containerView).inset(16.VAdapted)
            $0.leading.equalTo(companyLogoImageView.snp.trailing).offset(16.HAdapted)
        }
        
        companyTitleLabel.snp.makeConstraints {
            $0.centerY.equalTo(companyLogoImageView)
            $0.leading.equalTo(companyLogoImageView.snp.trailing).offset(16.HAdapted)
        }
        
        experienceDurationLabel.snp.makeConstraints {
            $0.bottom.equalTo(containerView).inset(16.VAdapted)
            $0.leading.equalTo(companyLogoImageView.snp.trailing).offset(16.HAdapted)
        }
        
        editInfoButton.snp.makeConstraints {
            $0.trailing.equalTo(containerView).inset(16.HAdapted)
            $0.centerY.equalTo(companyLogoImageView)
        }
    }
}
