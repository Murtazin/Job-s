//
//  ResponseTableViewCell.swift
//  Jobs
//
//  Created by Renat Murtazin on 04.11.2022.
//

import UIKit

final class ResponseTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "ResponseTableViewCell"
    
    // MARK: - UI
    
    private lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 10
        containerView.layer.borderColor = UIColor.systemGray3.cgColor
        containerView.layer.borderWidth = 1.0
        return containerView
    }()
    
    private lazy var companyLogoImageView: UIImageView = {
        let companyLogoImageView = UIImageView()
        companyLogoImageView.backgroundColor = .systemBackground
        companyLogoImageView.layer.cornerRadius = 10
        companyLogoImageView.layer.borderColor = UIColor.systemGray3.cgColor
        companyLogoImageView.layer.borderWidth = 1.0
        companyLogoImageView.image = #imageLiteral(resourceName: "logo-icon")
        companyLogoImageView.contentMode = .scaleAspectFill
        return companyLogoImageView
    }()
    
    private lazy var positionTitleLabel: UILabel = {
        let positionTitleLabel = UILabel()
        positionTitleLabel.text = "iOS разработчик"
        positionTitleLabel.textColor = .label
        positionTitleLabel.font = .systemFont(ofSize: 14.HAdapted, weight: .semibold)
        return positionTitleLabel
    }()
    
    private lazy var companyTitleLabel: UILabel = {
        let companyTitleLabel = UILabel()
        companyTitleLabel.text = "Job's"
        companyTitleLabel.textColor = .label
        companyTitleLabel.font = .systemFont(ofSize: 12.HAdapted)
        return companyTitleLabel
    }()
    
    private lazy var statusView = NavigationWordView(navigationWord: "Вам отказали")
    
    private lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = .systemGray3
        return lineView
    }()
    
    private lazy var respondButton: UIButton = {
        let respondButton = UIButton()
        respondButton.setTitle("Откликнуться", for: .normal)
        respondButton.setTitleColor(.systemBackground, for: .normal)
        respondButton.backgroundColor = .systemBlue
        respondButton.titleLabel?.font = UIFont.systemFont(ofSize: 12.HAdapted, weight: .medium)
        respondButton.layer.cornerRadius = 15.VAdapted
        respondButton.sizeToFit()
        return respondButton
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: .init(top: 16.VAdapted, left: 16.HAdapted, bottom: 16.VAdapted, right: 16.HAdapted))
    }
    
    // MARK: - Internal
    
    func configure() {
        
    }
}

// MARK: - Private

private extension ResponseTableViewCell {
    
    func setupUI() {
        backgroundColor = .systemBackground
        
        contentView.addSubview(containerView)
        
        containerView.snp.makeConstraints {
            $0.edges.equalTo(contentView)
        }
        
        containerView.addSubview(companyLogoImageView)
        containerView.addSubview(positionTitleLabel)
        containerView.addSubview(companyTitleLabel)
        containerView.addSubview(statusView)
        containerView.addSubview(lineView)
        containerView.addSubview(respondButton)
        
        companyLogoImageView.snp.makeConstraints {
            $0.top.leading.equalTo(containerView).inset(16.VAdapted)
            $0.size.equalTo([Constant.vacancyCompanyLogoImageHeightWidth, Constant.vacancyCompanyLogoImageHeightWidth].HResized)
        }
        
        positionTitleLabel.snp.makeConstraints {
            $0.top.equalTo(containerView).inset(20.VAdapted)
            $0.leading.equalTo(companyLogoImageView.snp.trailing).offset(16.HAdapted)
        }
        
        companyTitleLabel.snp.makeConstraints {
            $0.top.equalTo(positionTitleLabel.snp.bottom).offset(8.VAdapted)
            $0.leading.equalTo(companyLogoImageView.snp.trailing).offset(16.HAdapted)
        }
        
        statusView.snp.makeConstraints {
            $0.centerY.equalTo(companyLogoImageView)
            $0.trailing.equalTo(containerView).inset(16)
            $0.size.equalTo([Constant.vacancyNavigationWordViewWidth, Constant.vacancyNavigationWordViewHeight].HResized)
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(companyLogoImageView.snp.bottom).offset(16.VAdapted)
            $0.leading.trailing.equalTo(containerView)
            $0.height.equalTo(1.VAdapted)
        }
        
        respondButton.addTarget(self, action: #selector(respondButtonHandler), for: .touchUpInside)

        respondButton.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.bottom).offset(8.VAdapted)
            $0.leading.trailing.equalTo(containerView).inset(16.HAdapted)
            $0.height.equalTo(Constant.vacancyRespondButtonHeight.VAdapted)
        }
    }
    
    // MARK: - Objс
    
    @objc func respondButtonHandler(sender: UIButton) {
        print("Handled")
    }
}
