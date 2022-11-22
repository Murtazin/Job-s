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

final class ProfileMainTableSectionHeaderView: UITableViewHeaderFooterView {
    
    weak var delegate: IProfileMainTableSectionHeaderViewDelegate?
    
    // MARK: - UI
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
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
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private lazy var editInfoButton = UIButton()
    
    // MARK: - Initializers
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal
    
    func configure(model: ProfileMainInfoSectionHeaderModel, section: Int) {
        infoImageView.image = model.image
        infoTitleLabel.text = model.title
        editInfoButton.setImage(model.editImage, for: .normal)
        editInfoButton.tag = section
    }
}

// MARK: - Private

private extension ProfileMainTableSectionHeaderView {
    
    func setupUI() {
        addSubview(containerView)
        
        containerView.layer.cornerRadius = Constant.CornerRadius.View.infoSectionHeaderView
        containerView.layer.borderWidth = Constant.BorderWidth.View.infoSectionHeaderView
        containerView.layer.borderColor = UIColor.systemGray5.cgColor
        
        containerView.addSubview(infoImageView)
        containerView.addSubview(infoTitleLabel)
        containerView.addSubview(editInfoButton)
        
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16.HAdapted)
        }
        
        infoImageView.snp.makeConstraints {
            $0.leading.equalTo(containerView).inset(16.HAdapted)
            $0.centerY.equalTo(containerView)
            $0.size.equalTo([20, 20].HResized)
        }
        
        infoTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(infoImageView.snp.trailing).offset(16.HAdapted)
            $0.centerY.equalTo(infoImageView)
        }
        
        editInfoButton.addTarget(self, action: #selector(editInfoButtonHandler), for: .touchUpInside)
        
        editInfoButton.snp.makeConstraints {
            $0.trailing.equalTo(containerView).inset(16.HAdapted)
            $0.centerY.equalTo(containerView)
            $0.size.equalTo([20, 20].HResized)
        }
    }
    
    // MARK: - Objc
    
    @objc func editInfoButtonHandler(sender: UIButton) {
        delegate?.editInfoButtonHandler(tag: sender.tag)
    }
}
