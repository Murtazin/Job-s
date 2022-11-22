//
//  ProfileExpectedSalaryInfoTableViewCell.swift
//  Jobs
//
//  Created by Renat Murtazin on 20.11.2022.
//

import UIKit

final class ProfileExpectedSalaryInfoTableViewCell: UITableViewCell {
    
    // MARK: - UI
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    private lazy var sumLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .thin)
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
    
    func configure(expectedSalaryInfo: ProfileMainSalaryInfoModel) {
        sumLabel.text = expectedSalaryInfo.sum
    }
}

// MARK: - Private

private extension ProfileExpectedSalaryInfoTableViewCell {
    
    func setupUI() {
        backgroundColor = .systemBackground
        
        contentView.addSubview(containerView)
        
        containerView.addSubview(sumLabel)
        
        containerView.layer.cornerRadius = Constant.CornerRadius.View.infoView
        containerView.layer.borderWidth = Constant.BorderWidth.View.infoView
        containerView.layer.borderColor = UIColor.systemGray5.cgColor
        
        containerView.snp.makeConstraints {
            $0.edges.equalTo(contentView).inset(16.HAdapted)
        }
        
        sumLabel.snp.makeConstraints {
            $0.leading.equalTo(containerView).inset(16.HAdapted)
            $0.centerY.equalTo(containerView)
        }
    }
}
