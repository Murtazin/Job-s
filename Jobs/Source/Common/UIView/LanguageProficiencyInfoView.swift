//
//  LanguageProficiencyInfoView.swift
//  Jobs
//
//  Created by Renat Murtazin on 18.11.2022.
//

import UIKit

final class LanguageProficiencyInfoView: UIView {
    
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
    
    init(info: ProfileMainLanguageProficiencyInfoModel) {
        super.init(frame: .zero)
        
        countryFlagImageView.image = info.countryFlag
        languageTitleLabel.text = info.title
        proficiencyLevelLabel.text = info.level
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private

private extension LanguageProficiencyInfoView {
    
    func setupUI() {
        backgroundColor = .systemBackground
        
        addSubview(containerView)
        
        containerView.layer.cornerRadius = Constant.CornerRadius.View.infoView
        containerView.layer.borderWidth = Constant.BorderWidth.View.infoView
        containerView.layer.borderColor = UIColor.systemGray5.cgColor
        
        containerView.addSubview(countryFlagImageView)
        containerView.addSubview(languageTitleLabel)
        containerView.addSubview(proficiencyLevelLabel)
        containerView.addSubview(editInfoButton)
        
        containerView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16.VAdapted)
            $0.leading.trailing.equalToSuperview().inset(16.HAdapted)
            $0.bottom.equalToSuperview()
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
