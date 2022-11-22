//
//  ProfileEducationInfoTableViewCell.swift
//  Jobs
//
//  Created by Renat Murtazin on 21.11.2022.
//

import UIKit

class EducationInfoTableViewCell: UITableViewCell {
    
    // MARK: - UI
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    private lazy var institutionLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var facultyTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private lazy var institutionTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 14, weight: .thin)
        return label
    }()
    
    private lazy var educationDurationLabel: UILabel = {
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
    
    func configure(educationInfo: ProfileMainEducationInfoModel) {
        institutionLogoImageView.image = educationInfo.institutionLogo
        institutionTitleLabel.text = educationInfo.institutionTitle
        facultyTitleLabel.text = educationInfo.faculty
        educationDurationLabel.text = educationInfo.duration
    }
}

// MARK: - Private

private extension EducationInfoTableViewCell {
    
    func setupUI() {
        backgroundColor = .systemBackground
        
        contentView.addSubview(containerView)
        
        containerView.layer.cornerRadius = Constant.CornerRadius.View.infoView
        containerView.layer.borderWidth = Constant.BorderWidth.View.infoView
        containerView.layer.borderColor = UIColor.systemGray5.cgColor
        
        containerView.addSubview(institutionLogoImageView)
        containerView.addSubview(facultyTitleLabel)
        containerView.addSubview(institutionTitleLabel)
        containerView.addSubview(educationDurationLabel)
        containerView.addSubview(editInfoButton)
        
        containerView.snp.makeConstraints {
            $0.edges.equalTo(contentView).inset(16.HAdapted)
        }
        
        institutionLogoImageView.layer.cornerRadius = Constant.CornerRadius.View.infoView
        institutionLogoImageView.layer.borderWidth = Constant.BorderWidth.View.infoView
        institutionLogoImageView.layer.borderColor = UIColor.systemGray5.cgColor
        
        institutionLogoImageView.snp.makeConstraints {
            $0.leading.equalTo(containerView).inset(16.HAdapted)
            $0.centerY.equalTo(containerView)
            $0.size.equalTo([Constant.Width.ImageView.institutionLogo, Constant.Height.ImageView.institutionLogo].HResized)
        }
        
        facultyTitleLabel.snp.makeConstraints {
            $0.top.equalTo(containerView).inset(16.VAdapted)
            $0.leading.equalTo(institutionLogoImageView.snp.trailing).offset(16.HAdapted)
        }
        
        institutionTitleLabel.snp.makeConstraints {
            $0.centerY.equalTo(institutionLogoImageView)
            $0.leading.equalTo(institutionLogoImageView.snp.trailing).offset(16.HAdapted)
        }
        
        educationDurationLabel.snp.makeConstraints {
            $0.bottom.equalTo(containerView).inset(16.VAdapted)
            $0.leading.equalTo(institutionLogoImageView.snp.trailing).offset(16.HAdapted)
        }
        
        editInfoButton.snp.makeConstraints {
            $0.trailing.equalTo(containerView).inset(16.HAdapted)
            $0.centerY.equalTo(institutionLogoImageView)
        }
    }
}
