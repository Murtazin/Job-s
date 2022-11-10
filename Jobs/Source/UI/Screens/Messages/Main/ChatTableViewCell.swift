//
//  ChatTableViewCell.swift
//  Jobs
//
//  Created by Renat Murtazin on 31.10.2022.
//

import UIKit

final class ChatTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "ChatTableViewCell"
    
    // MARK: - UI
    
    private lazy var companyLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var positionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private lazy var companyTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 12, weight: .light)
        return label
    }()
    
    private lazy var lastMessageDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14, weight: .light)
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
    
    func configure(model: Chat) {
        companyLogoImageView.image = model.companyLogo
        companyTitleLabel.text = model.companyTitle
        positionLabel.text = model.position
        statusLabel.text = model.status
        lastMessageDateLabel.text = model.lastMessageDate
    }
}

// MARK: - Private

private extension ChatTableViewCell {
    
    func setupUI() {
        backgroundColor = .systemBackground
        
        contentView.addSubview(companyLogoImageView)
        contentView.addSubview(positionLabel)
        contentView.addSubview(companyTitleLabel)
        contentView.addSubview(statusLabel)
        contentView.addSubview(lastMessageDateLabel)
        
        companyLogoImageView.layer.cornerRadius = frame.width / 2
        
        companyLogoImageView.snp.makeConstraints {
            $0.centerY.equalTo(contentView)
            $0.size.equalTo([55, 55].HResized)
            $0.leading.equalTo(contentView).inset(16.HAdapted)
        }
        
        positionLabel.snp.makeConstraints {
            $0.top.equalTo(companyLogoImageView)
            $0.leading.equalTo(companyLogoImageView.snp.trailing).offset(16.HAdapted)
        }
        
        companyTitleLabel.snp.makeConstraints {
            $0.top.equalTo(positionLabel.snp.bottom).offset(4.VAdapted)
            $0.leading.equalTo(companyLogoImageView.snp.trailing).offset(16.HAdapted)
        }

        statusLabel.snp.makeConstraints {
            $0.top.equalTo(companyTitleLabel.snp.bottom).offset(6.VAdapted)
            $0.leading.equalTo(companyLogoImageView.snp.trailing).offset(16.HAdapted)
        }

        lastMessageDateLabel.snp.makeConstraints {
            $0.top.equalTo(companyLogoImageView)
            $0.trailing.equalTo(contentView).inset(16.HAdapted)
        }
    }
}
