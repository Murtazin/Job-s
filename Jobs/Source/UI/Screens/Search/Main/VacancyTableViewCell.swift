//
//  VacancyTableViewCell.swift
//  Jobs
//
//  Created by Renat Murtazin on 22.10.2022.
//

import UIKit

final class VacancyTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "VacancyTableViewCell"
    
    // MARK: - Private properties
    
    private let navigationWordsViews: [NavigationWordView] = [
        NavigationWordView(navigationWord: "Подработка"),
        NavigationWordView(navigationWord: "Можно без резюме")
    ]
    
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
    
    private lazy var addToFavouritesButton: UIButton = {
        let addToFavButton = UIButton()
        let configuration = UIImage.SymbolConfiguration(pointSize: 25)
        addToFavButton.setImage(UIImage(systemName: "heart", withConfiguration: configuration), for: .normal)
        addToFavButton.tintColor = .systemBlue
        return addToFavButton
    }()
    
    private lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = .systemGray3
        return lineView
    }()
    
    private lazy var navigationWordsStackView: UIStackView = {
        let navWordsSV = UIStackView(arrangedSubviews: navigationWordsViews)
        navWordsSV.axis = .vertical
        navWordsSV.alignment = .center
        navWordsSV.distribution = .equalSpacing
        navWordsSV.spacing = 15.VAdapted
        return navWordsSV
    }()
    
    private lazy var cityTitleLabel: UILabel = {
        let cityTitleLabel = UILabel()
        cityTitleLabel.text = "Казань, республика Татарстан"
        cityTitleLabel.textColor = .label
        cityTitleLabel.font = .systemFont(ofSize: 13.HAdapted, weight: .medium)
        return cityTitleLabel
    }()
    
    private lazy var salaryLabel: UILabel = {
        let salaryLabel = UILabel()
        salaryLabel.text = "120.000 - 200.000 ₽/месяц"
        salaryLabel.textColor = .systemBlue
        salaryLabel.font = .systemFont(ofSize: 13.HAdapted)
        return salaryLabel
    }()
    
    private lazy var salaryCityLabelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [cityTitleLabel, salaryLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 20.VAdapted
        return stackView
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

private extension VacancyTableViewCell {
    
    func setupUI() {
        backgroundColor = .systemBackground
        
        contentView.addSubview(containerView)
        
        containerView.snp.makeConstraints {
            $0.edges.equalTo(contentView)
        }
        
        containerView.addSubview(companyLogoImageView)
        containerView.addSubview(positionTitleLabel)
        containerView.addSubview(companyTitleLabel)
        containerView.addSubview(addToFavouritesButton)
        containerView.addSubview(lineView)
        containerView.addSubview(navigationWordsStackView)
        containerView.addSubview(salaryCityLabelsStackView)
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
        
        addToFavouritesButton.addTarget(self, action: #selector(addToFavouritesButtonHandler), for: .touchUpInside)
        
        addToFavouritesButton.snp.makeConstraints {
            $0.centerY.equalTo(companyLogoImageView)
            $0.trailing.equalTo(containerView).inset(16.HAdapted)
            $0.size.equalTo([Constant.addToFavButtonWidth, Constant.addToFavButtonHeight].HResized)
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(companyLogoImageView.snp.bottom).offset(16.VAdapted)
            $0.leading.trailing.equalTo(containerView)
            $0.height.equalTo(1.VAdapted)
        }
        
        if !navigationWordsViews.isEmpty {
            navigationWordsViews.forEach { view in
                view.snp.makeConstraints {
                    $0.size.equalTo([Constant.vacancyNavigationWordViewWidth, Constant.vacancyNavigationWordViewHeight].HResized)
                }
            }
            
            navigationWordsStackView.snp.makeConstraints {
                $0.top.equalTo(lineView).inset(16.VAdapted)
                $0.leading.equalTo(containerView).inset(16.HAdapted)
            }
        }
        
        salaryCityLabelsStackView.snp.makeConstraints {
            $0.top.equalTo(lineView).inset(16.VAdapted)
            $0.trailing.equalTo(containerView).inset(16.HAdapted)
        }
        
        respondButton.addTarget(self, action: #selector(respondButtonHandler), for: .touchUpInside)

        respondButton.snp.makeConstraints {
            $0.leading.trailing.equalTo(containerView).inset(16.HAdapted)
            $0.bottom.equalTo(containerView).inset(12.VAdapted)
            $0.height.equalTo(Constant.vacancyRespondButtonHeight.VAdapted)
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
