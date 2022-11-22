//
//  ResponseTableViewCell.swift
//  Jobs
//
//  Created by Renat Murtazin on 04.11.2022.
//

import UIKit

final class ResponseTableViewCell: UITableViewCell {
    
    // MARK: - UI
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    private lazy var companyLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constant.Image.Internal.logo
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemBackground
        return imageView
    }()
    
    private lazy var positionTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private lazy var companyTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 14, weight: .thin)
        return label
    }()
    
    private lazy var statusView = ResponseStatusView()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()

    private lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    private lazy var respondButton: BlueRoundedButton = {
        let button = BlueRoundedButton(title: Constant.ButtonTitle.respond)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .heavy)
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
    
    func configure(response: ResponseModel) {
        companyLogoImageView.image = response.companyLogoImage
        positionTitleLabel.text = response.positionTitle
        companyTitleLabel.text = response.companyTitle
        statusView.configure(status: response.status)
    }
}

// MARK: - Private

private extension ResponseTableViewCell {
    
    func setupUI() {
        backgroundColor = .systemBackground
        
        contentView.addSubview(containerView)
        
        containerView.layer.cornerRadius = Constant.CornerRadius.View.vacancyContainer
        containerView.layer.borderWidth = Constant.BorderWidth.View.vacancyContainer
        containerView.layer.borderColor = UIColor.systemGray5.cgColor
        
        containerView.snp.makeConstraints {
            $0.top.bottom.equalTo(contentView).inset(8.VAdapted)
            $0.leading.trailing.equalTo(contentView).inset(16.HAdapted)
        }
        
        containerView.addSubview(companyLogoImageView)
        containerView.addSubview(positionTitleLabel)
        containerView.addSubview(companyTitleLabel)
        containerView.addSubview(statusView)
        containerView.addSubview(lineView)
        containerView.addSubview(bottomView)
        
        bottomView.addSubview(respondButton)
        
        companyLogoImageView.layer.cornerRadius = Constant.CornerRadius.ImageView.companyLogo
        companyLogoImageView.layer.borderWidth = Constant.BorderWidth.ImageView.companyLogo
        companyLogoImageView.layer.borderColor = UIColor.systemGray5.cgColor
        
        companyLogoImageView.snp.makeConstraints {
            $0.top.leading.equalTo(containerView).inset(16.VAdapted)
            $0.size.equalTo([Constant.Width.Image.vacancyCompanyLogo, Constant.Height.Image.vacancyCompanyLogo].HResized)
        }
        
        positionTitleLabel.snp.makeConstraints {
            $0.top.equalTo(companyLogoImageView).offset(4.VAdapted)
            $0.leading.equalTo(companyLogoImageView.snp.trailing).offset(8.HAdapted)
        }
        
        companyTitleLabel.snp.makeConstraints {
            $0.top.equalTo(positionTitleLabel.snp.bottom).offset(8.VAdapted)
            $0.leading.equalTo(companyLogoImageView.snp.trailing).offset(8.HAdapted)
        }
        
        statusView.snp.makeConstraints {
            $0.trailing.equalTo(containerView).inset(16.HAdapted)
            $0.centerY.equalTo(companyLogoImageView)
            $0.size.equalTo([Constant.Width.View.responseStatus, Constant.Height.View.responseStatus].HResized)
        }
        
        let lineViewWidth: CGFloat = contentView.frame.width
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(companyLogoImageView.snp.bottom).offset(16.VAdapted)
            $0.centerX.equalTo(containerView)
            $0.size.equalTo([Int(lineViewWidth), Constant.Height.View.line].HResized)
        }
        
        bottomView.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.bottom)
            $0.leading.bottom.trailing.equalTo(containerView)
        }

        respondButton.layer.cornerRadius = Constant.CornerRadius.Button.respond
        
        respondButton.addTarget(self, action: #selector(respondButtonHandler), for: .touchUpInside)

        respondButton.snp.makeConstraints {
            $0.centerY.centerX.equalTo(bottomView)
            $0.size.equalTo([Constant.Width.Button.respond, Constant.Height.Button.respond].HResized)
        }
    }
    
    // MARK: - Objс
    
    @objc func respondButtonHandler(sender: UIButton) {
        print("Handled")
    }
}
