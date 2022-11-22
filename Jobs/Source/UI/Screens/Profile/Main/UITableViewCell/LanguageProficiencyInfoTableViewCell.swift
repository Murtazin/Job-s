//
//  ProfileLanguageProficiencyInfoTableViewCell.swift
//  Jobs
//
//  Created by Renat Murtazin on 22.11.2022.
//

import UIKit

final class LanguageProficiencyInfoTableViewCell: UITableViewCell {
    
    // MARK: - UI
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()

    private lazy var countryFlagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var languageTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private lazy var proficiencyLevelLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 14, weight: .thin)
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
    
    func configure(languageProficiencyInfo: ProfileMainLanguageProficiencyInfoModel) {
        countryFlagImageView.image = languageProficiencyInfo.countryFlag
        languageTitleLabel.text = languageProficiencyInfo.title
        proficiencyLevelLabel.text = languageProficiencyInfo.level
    }
}

// MARK: - Private

private extension LanguageProficiencyInfoTableViewCell {
    
    func setupUI() {
        backgroundColor = .systemBackground
        
        contentView.addSubview(containerView)
        
        containerView.layer.cornerRadius = Constant.CornerRadius.View.infoView
        containerView.layer.borderWidth = Constant.BorderWidth.View.infoView
        containerView.layer.borderColor = UIColor.systemGray5.cgColor
        
        containerView.addSubview(countryFlagImageView)
        containerView.addSubview(languageTitleLabel)
        containerView.addSubview(proficiencyLevelLabel)
        containerView.addSubview(editInfoButton)
        
        containerView.snp.makeConstraints {
            $0.edges.equalTo(contentView).inset(16.HAdapted)
        }
        
        countryFlagImageView.layer.cornerRadius = Constant.CornerRadius.View.infoView
        countryFlagImageView.layer.borderWidth = Constant.BorderWidth.View.infoView
        countryFlagImageView.layer.borderColor = UIColor.systemGray5.cgColor
        
        countryFlagImageView.snp.makeConstraints {
            $0.leading.equalTo(containerView).inset(16.HAdapted)
            $0.centerY.equalTo(containerView)
            $0.size.equalTo([Constant.Width.ImageView.countryFlag, Constant.Height.ImageView.countryFlag].HResized)
        }
        
        languageTitleLabel.snp.makeConstraints {
            $0.top.equalTo(containerView).inset(10.VAdapted)
            $0.leading.equalTo(countryFlagImageView.snp.trailing).offset(16.HAdapted)
        }
        
        proficiencyLevelLabel.snp.makeConstraints {
            $0.bottom.equalTo(containerView).inset(10.VAdapted)
            $0.leading.equalTo(countryFlagImageView.snp.trailing).offset(16.HAdapted)
        }
        
        editInfoButton.snp.makeConstraints {
            $0.trailing.equalTo(containerView).inset(16.HAdapted)
            $0.centerY.equalTo(countryFlagImageView)
        }
    }
}
