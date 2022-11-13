//
//  VacancyTableViewCell.swift
//  Jobs
//
//  Created by Renat Murtazin on 22.10.2022.
//

import UIKit

final class VacancyTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "VacancyTableViewCell"
    
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
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private lazy var companyTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private lazy var addToFavouritesButton: UIButton = {
        let button = UIButton()
        let configuration = Constant.SymbolConfiguration.pointSize25
        let name = Constant.SystemImageName.addToFavourites
        let image = UIImage(systemName: name,
                            withConfiguration: configuration)
        button.setImage(image, for: .normal)
        button.tintColor = .systemBlue
        return button
    }()
    
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
    
    private lazy var cityTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.sizeToFit()
        return label
    }()
    
    private lazy var salaryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    private lazy var respondButton: BlueRoundedButton = {
        let button = BlueRoundedButton(title: Constant.ButtonTitle.respond)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
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
    
    func configure(model: VacancyModel) {
        companyLogoImageView.image = model.companyLogoImage
        positionTitleLabel.text = model.positionTitle
        companyTitleLabel.text = model.companyTitle
        cityTitleLabel.text = model.cityTitle
        salaryLabel.text = model.salary
    }
}

// MARK: - Private

private extension VacancyTableViewCell {
    
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
        containerView.addSubview(addToFavouritesButton)
        containerView.addSubview(lineView)
        containerView.addSubview(bottomView)
        
        bottomView.addSubview(cityTitleLabel)
        bottomView.addSubview(salaryLabel)
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
            $0.leading.equalTo(companyLogoImageView.snp.trailing).offset(16.HAdapted)
        }
        
        companyTitleLabel.snp.makeConstraints {
            $0.top.equalTo(positionTitleLabel.snp.bottom).offset(8.VAdapted)
            $0.leading.equalTo(companyLogoImageView.snp.trailing).offset(16.HAdapted)
        }
        
        addToFavouritesButton.addTarget(self, action: #selector(addToFavouritesButtonHandler), for: .touchUpInside)
        
        addToFavouritesButton.snp.makeConstraints {
            $0.trailing.equalTo(containerView).inset(16.HAdapted)
            $0.centerY.equalTo(companyLogoImageView)
            $0.size.equalTo([Constant.Width.Button.addToFavourites, Constant.Height.Button.addToFavourites].HResized)
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
        
        cityTitleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        cityTitleLabel.snp.makeConstraints {
            $0.top.equalTo(bottomView).inset(16.VAdapted)
            $0.centerX.equalTo(bottomView)
        }
        
        salaryLabel.snp.makeConstraints {
            $0.top.equalTo(cityTitleLabel.snp.bottom).offset(16)
            $0.centerX.equalTo(bottomView)
        }

        respondButton.layer.cornerRadius = Constant.CornerRadius.Button.respond
        
        respondButton.addTarget(self, action: #selector(respondButtonHandler), for: .touchUpInside)

        respondButton.snp.makeConstraints {
            $0.top.equalTo(salaryLabel.snp.bottom).offset(16)
            $0.bottom.equalTo(bottomView).inset(16.VAdapted)
            $0.centerX.equalTo(bottomView)
            $0.size.equalTo([Constant.Width.Button.respond, Constant.Height.Button.respond].HResized)
        }
    }
    
    // MARK: - Objc
    
    @objc func addToFavouritesButtonHandler(sender: UIButton) {
        print("Handled")
    }
    
    @objc func respondButtonHandler(sender: UIButton) {
        print("Handled")
    }
}
