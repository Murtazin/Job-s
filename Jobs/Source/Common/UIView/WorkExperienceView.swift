//
//  WorkExperienceView.swift
//  Jobs
//
//  Created by Renat Murtazin on 08.11.2022.
//

import UIKit

final class WorkExperienceView: UIView {
    
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
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private lazy var companyTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        return label
    }()
    
    private lazy var experienceDurationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private lazy var editInfoButton: UIButton = {
        let button = UIButton()
        let configuration = UIImage.SymbolConfiguration(pointSize: 22)
        let image = UIImage(systemName: "pencil.line", withConfiguration: configuration)
        button.setImage(image, for: .normal)
        return button
    }()
    
    // MARK: - Initializers

    init(model: WorkExperienceModel) {
        super.init(frame: .zero)
        
        companyLogoImageView.image = model.companyLogoImage
        positionTitleLabel.text = model.positionTitle
        companyTitleLabel.text = model.companyTitle
        experienceDurationLabel.text = model.experienceDuration
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal
    
    func configure() {
        
    }
}

// MARK: - Private

private extension WorkExperienceView {
    
    func setupUI() {
        backgroundColor = .systemBackground
        
        addSubview(containerView)
        
        containerView.addSubview(companyLogoImageView)
        containerView.addSubview(positionTitleLabel)
        containerView.addSubview(companyTitleLabel)
        containerView.addSubview(experienceDurationLabel)
        containerView.addSubview(editInfoButton)
        
        containerView.layer.cornerRadius = 15
        containerView.layer.borderColor = UIColor.systemGray6.cgColor
        containerView.layer.borderWidth = 1.0
        
        containerView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16.VAdapted)
            $0.leading.trailing.equalToSuperview().inset(16.HAdapted)
            $0.bottom.equalToSuperview()
        }
        
        companyLogoImageView.snp.makeConstraints {
            $0.centerY.equalTo(containerView)
            $0.leading.equalTo(containerView).inset(16.HAdapted)
            $0.size.equalTo([60, 60].HResized)
        }
        
        positionTitleLabel.snp.makeConstraints {
            $0.top.equalTo(containerView).inset(16)
            $0.leading.equalTo(companyLogoImageView.snp.trailing).offset(16.HAdapted)
        }
        
        companyTitleLabel.snp.makeConstraints {
            $0.centerY.equalTo(companyLogoImageView)
            $0.leading.equalTo(companyLogoImageView.snp.trailing).offset(16.HAdapted)
        }
        
        experienceDurationLabel.snp.makeConstraints {
            $0.leading.equalTo(companyLogoImageView.snp.trailing).offset(16.HAdapted)
            $0.bottom.equalTo(containerView).inset(16.VAdapted)
        }
        
        editInfoButton.snp.makeConstraints {
            $0.centerY.equalTo(containerView)
            $0.trailing.equalTo(containerView).inset(16.HAdapted)
        }
    }
}
