//
//  ProfileMainTableSectionHeaderView.swift
//  Jobs
//
//  Created by Renat Murtazin on 07.11.2022.
//

import UIKit

protocol IProfileMainTableSectionHeaderViewDelegate: AnyObject {
    func editInfoButtonHandler(tag: Int)
}

final class ProfileMainTableSectionHeaderView: UIView {
    
    weak var delegate: IProfileMainTableSectionHeaderViewDelegate?
    
    // MARK: - UI
    
    private lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 15
        containerView.layer.borderColor = UIColor.systemGray6.cgColor
        containerView.layer.borderWidth = 1.0
        return containerView
    }()
    
    private lazy var infoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .systemBlue
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var infoTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private lazy var editInfoButton = UIButton()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal
    
    func configure(model: ProfileMainTableSectionHeaderModel, section: Int) {
        infoImageView.image = model.infoImage
        infoTitleLabel.text = model.infoTitle
        editInfoButton.tag = section
        editInfoButton.setImage(model.editInfoImage, for: .normal)
    }
}

// MARK: - Private

private extension ProfileMainTableSectionHeaderView {
    
    func setupUI() {
        addSubview(containerView)
        
        containerView.addSubview(infoImageView)
        containerView.addSubview(infoTitleLabel)
        containerView.addSubview(editInfoButton)
        
        containerView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16.HAdapted)
        }
        
        infoImageView.snp.makeConstraints {
            $0.centerY.equalTo(containerView)
            $0.leading.equalTo(containerView).inset(16.HAdapted)
        }
        
        infoTitleLabel.snp.makeConstraints {
            $0.centerY.equalTo(infoImageView)
            $0.leading.equalTo(infoImageView.snp.trailing).offset(16.HAdapted)
        }
        
        editInfoButton.addTarget(self, action: #selector(editInfoButtonHandler), for: .touchUpInside)
        
        editInfoButton.snp.makeConstraints {
            $0.centerY.equalTo(containerView)
            $0.trailing.equalTo(containerView).inset(16.HAdapted)
        }
    }
    
    // MARK: - Objc
    
    @objc func editInfoButtonHandler(sender: UIButton) {
        delegate?.editInfoButtonHandler(tag: sender.tag)
    }
}
