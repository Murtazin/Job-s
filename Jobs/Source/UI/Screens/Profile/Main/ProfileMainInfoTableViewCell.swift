//
//  ProfileMainInfoTableViewCell.swift
//  Jobs
//
//  Created by Renat Murtazin on 02.11.2022.
//

import UIKit

final class ProfileMainInfoTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "ProfileMainInfoTableViewCell"
    
    // MARK: - UI
    
    private lazy var infoImageView: UIImageView = {
        let imageView = UIImageView()
        let configuration = UIImage.SymbolConfiguration(pointSize: 22)
        imageView.image = UIImage(systemName: "person", withConfiguration: configuration)
        imageView.tintColor = .systemBlue
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var infoTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Контактная информация"
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private lazy var editInfoButton: UIButton = {
        let configuration = UIImage.SymbolConfiguration(pointSize: 22)
        let image = UIImage(systemName: "pencil.line", withConfiguration: configuration)
        let button = UIButton()
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
}

// MARK: - Private

private extension ProfileMainInfoTableViewCell {
    
    func setupUI() {
        contentView.addSubview(infoImageView)
        contentView.addSubview(infoTitleLabel)
        contentView.addSubview(editInfoButton)
        
        infoImageView.snp.makeConstraints {
            $0.centerY.equalTo(contentView)
            $0.leading.equalTo(contentView).inset(16.HAdapted)
        }
        
        infoTitleLabel.snp.makeConstraints {
            $0.centerY.equalTo(infoImageView)
            $0.leading.equalTo(infoImageView.snp.trailing).offset(16.HAdapted)
        }
        
        editInfoButton.snp.makeConstraints {
            $0.centerY.equalTo(contentView)
            $0.trailing.equalTo(contentView).inset(16.HAdapted)
        }
    }
}
