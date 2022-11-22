//
//  ProfileMainViewController.swift
//  Jobs
//
//  Created by Renat Murtazin on 22.10.2022.
//

import UIKit

final class ProfileMainViewController: UIViewController {
    
    // MARK: - Private properties
    
    private var eventClosure: ((ProfileMainViewController.Event) -> Void)?
    
    var cellHeights = [IndexPath: CGFloat]()
    
    private var profileInfo: [ProfileMainInfoModel] = [
        ProfileMainInfoModel(sectionHeader: ProfileMainInfoSectionHeaderModel(
            title: "Контактная информация",
            image: UIImage(systemName: "person",
                           withConfiguration: Constant.SymbolConfiguration.pointSize22) ?? Constant.Image.Internal.logo,
            editImage: UIImage(systemName: "pencil",
                               withConfiguration: Constant.SymbolConfiguration.pointSize22) ?? Constant.Image.Internal.logo),
                             info: [
                                .contact(ProfileMainContactInfoModel(
                                    location: "Kazan",
                                    phoneNumber: "+79375858252",
                                    mail: "testemail@mail.ru"))
                             ]),
        ProfileMainInfoModel(sectionHeader: ProfileMainInfoSectionHeaderModel(
            title: "Ожидаемая зарплата",
            image: UIImage(systemName: "creditcard",
                           withConfiguration: Constant.SymbolConfiguration.pointSize22) ?? Constant.Image.Internal.logo,
            editImage: UIImage(systemName: "pencil",
                               withConfiguration: Constant.SymbolConfiguration.pointSize22) ?? Constant.Image.Internal.logo),
                             info: [
                                .expectedSalary(ProfileMainSalaryInfoModel(sum: "200.000₽ - 1.000.000₽"))
                             ]),
        ProfileMainInfoModel(sectionHeader: ProfileMainInfoSectionHeaderModel(
            title: "Опыт работы",
            image: UIImage(systemName: "clock",
                           withConfiguration: Constant.SymbolConfiguration.pointSize22) ?? Constant.Image.Internal.logo,
            editImage: UIImage(systemName: "plus",
                               withConfiguration: Constant.SymbolConfiguration.pointSize22) ?? Constant.Image.Internal.logo),
                             info: [
                                .workExperience(ProfileMainWorkExperienceInfoModel(
                                    companyLogo: Constant.Image.Internal.logo,
                                    companyTitle: "Job's",
                                    position: "iOS developer",
                                    duration: "01.01.20 - 01.01.23"))
                             ]),
        ProfileMainInfoModel(sectionHeader: ProfileMainInfoSectionHeaderModel(
            title: "Образование",
            image: UIImage(systemName: "doc.text.fill",
                           withConfiguration: Constant.SymbolConfiguration.pointSize22) ?? Constant.Image.Internal.logo,
            editImage: UIImage(systemName: "plus",
                               withConfiguration: Constant.SymbolConfiguration.pointSize22) ?? Constant.Image.Internal.logo),
                             info: [
                                .education(ProfileMainEducationInfoModel(
                                    institutionLogo: Constant.Image.Internal.logo,
                                    institutionTitle: "Kpfu",
                                    faculty: "Программная инженерия",
                                    duration: "01.09.20 - 01.09.24")),
                                .education(ProfileMainEducationInfoModel(
                                    institutionLogo: Constant.Image.Internal.logo,
                                    institutionTitle: "KPFU",
                                    faculty: "Программная инженерия",
                                    duration: "01.09.20 - 01.09.24"))
                             ]),
        ProfileMainInfoModel(sectionHeader: ProfileMainInfoSectionHeaderModel(
            title: "Ключевые навыки",
            image: UIImage(systemName: "wand.and.rays",
                           withConfiguration: Constant.SymbolConfiguration.pointSize22) ?? Constant.Image.Internal.logo,
            editImage: UIImage(systemName: "pencil",
                               withConfiguration: Constant.SymbolConfiguration.pointSize22) ?? Constant.Image.Internal.logo),
                             info: [
                                .keySkills(ProfileMainKeySkillsInfoModel(description: "Xcode")),
                                .keySkills(ProfileMainKeySkillsInfoModel(description: "Swift")),
                                .keySkills(ProfileMainKeySkillsInfoModel(description: "UIKit")),
                                .keySkills(ProfileMainKeySkillsInfoModel(description: "SwiftUI")),
                                .keySkills(ProfileMainKeySkillsInfoModel(description: "Xcode")),
                                .keySkills(ProfileMainKeySkillsInfoModel(description: "Swift")),
                                .keySkills(ProfileMainKeySkillsInfoModel(description: "UIKit")),
                                .keySkills(ProfileMainKeySkillsInfoModel(description: "SwiftUI")),
                                .keySkills(ProfileMainKeySkillsInfoModel(description: "Xcode")),
                                .keySkills(ProfileMainKeySkillsInfoModel(description: "Swift")),
                                .keySkills(ProfileMainKeySkillsInfoModel(description: "UIKit")),
                                .keySkills(ProfileMainKeySkillsInfoModel(description: "SwiftUI")),
                                .keySkills(ProfileMainKeySkillsInfoModel(description: "Xcode")),
                                .keySkills(ProfileMainKeySkillsInfoModel(description: "Swift")),
                                .keySkills(ProfileMainKeySkillsInfoModel(description: "UIKit")),
                                .keySkills(ProfileMainKeySkillsInfoModel(description: "SwiftUI")),
                                .keySkills(ProfileMainKeySkillsInfoModel(description: "SwiftUI"))
                             ]),
        ProfileMainInfoModel(sectionHeader: ProfileMainInfoSectionHeaderModel(
            title: "Владение языками",
            image: UIImage(systemName: "ellipsis.bubble",
                           withConfiguration: Constant.SymbolConfiguration.pointSize22) ?? Constant.Image.Internal.logo,
            editImage: UIImage(systemName: "plus",
                               withConfiguration: Constant.SymbolConfiguration.pointSize22) ?? Constant.Image.Internal.logo),
                             info: [
                                .languageProficiency(ProfileMainLanguageProficiencyInfoModel(
                                    countryFlag: Constant.Image.Internal.logo,
                                    title: "English",
                                    level: "A2"))
                             ]),
        ProfileMainInfoModel(sectionHeader: ProfileMainInfoSectionHeaderModel(
            title: "Дополнительно",
            image: UIImage(systemName: "ellipsis",
                           withConfiguration: Constant.SymbolConfiguration.pointSize22) ?? Constant.Image.Internal.logo,
            editImage: UIImage(systemName: "plus",
                               withConfiguration: Constant.SymbolConfiguration.pointSize22) ?? Constant.Image.Internal.logo),
                             info: [
                                .additionally
                             ])
    ]
    
    // MARK: - UI
    
    private lazy var tableHeaderView = ProfileMainHeaderView()
    
    private lazy var infoTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.estimatedSectionHeaderHeight = [0, Constant.TableSectionHeaderHeight.profileMain].VResized.height
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    // MARK: - Initializers
    
    init(eventClosure: ((ProfileMainViewController.Event) -> Void)? = nil) {
        self.eventClosure = eventClosure
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

// MARK: - Private

private extension ProfileMainViewController {
    
    func setupUI() {
        view.backgroundColor = .systemBackground
    
        let settingsImage = Constant.Image.System.profileMainSettings
        let settingsButton = UIBarButtonItem(image: settingsImage, style: .done, target: self, action: #selector(settingsButtonHandler))
        
        navigationItem.title = Constant.NavigationItemTitle.profile
        navigationItem.rightBarButtonItem = settingsButton
        
        view.addSubview(infoTableView)
        
        let tableHeaderViewWidth: CGFloat = view.frame.width
        let tableHeaderViewHeight: Int = Constant.TableHeaderViewHeight.profileMain
        let tableHeaderViewSize: CGSize = [Int(tableHeaderViewWidth), tableHeaderViewHeight].HResized
        
        tableHeaderView.frame = CGRect(origin: .init(x: 0, y: 0), size: tableHeaderViewSize)
        
        tableHeaderView.delegate = self
        
        infoTableView.tableHeaderView = tableHeaderView
        
        infoTableView.delegate = self
        infoTableView.dataSource = self
        
        infoTableView.register(ProfileContactInfoTableViewCell.self,
                               forCellReuseIdentifier: ProfileContactInfoTableViewCell.reuseIdentifier)
        infoTableView.register(ProfileExpectedSalaryInfoTableViewCell.self,
                               forCellReuseIdentifier: ProfileExpectedSalaryInfoTableViewCell.reuseIdentifier)
        infoTableView.register(ProfileWorkExperienceInfoTableViewCell.self,
                               forCellReuseIdentifier: ProfileWorkExperienceInfoTableViewCell.reuseIdentifier)
        infoTableView.register(ProfileEducationInfoTableViewCell.self,
                               forCellReuseIdentifier: ProfileEducationInfoTableViewCell.reuseIdentifier)
        infoTableView.register(ProfileKeySkillsInfoTableViewCell.self,
                               forCellReuseIdentifier: ProfileKeySkillsInfoTableViewCell.reuseIdentifier)
        infoTableView.register(ProfileLanguageProficiencyInfoTableViewCell.self,
                               forCellReuseIdentifier: ProfileLanguageProficiencyInfoTableViewCell.reuseIdentifier)
        
        infoTableView.register(ProfileMainTableSectionHeaderView.self,
                               forHeaderFooterViewReuseIdentifier: ProfileMainTableSectionHeaderView.reuseIdentifier)
        
        infoTableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    // MARK: - Objc
    
    @objc func settingsButtonHandler(sender: UIBarButtonItem) {
        
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension ProfileMainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return profileInfo.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 4:
            return Constant.NumberOfRowsInSection.keySkillsInfo
        default:
            return profileInfo[section].info.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return [0, Constant.TableViewRowHeight.contactInfo].VResized.height
        case 1:
            return [0, Constant.TableViewRowHeight.expectedSalaryInfo].VResized.height
        case 2:
            return [0, Constant.TableViewRowHeight.workExperienceInfo].VResized.height
        case 3:
            return [0, Constant.TableViewRowHeight.educationInfo].VResized.height
        case 4:
            return UITableView.automaticDimension
        case 5:
            return [0, Constant.TableViewRowHeight.languageProficiencyInfo].VResized.height
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return [0, Constant.TableViewRowHeight.contactInfo].VResized.height
        case 1:
            return [0, Constant.TableViewRowHeight.expectedSalaryInfo].VResized.height
        case 2:
            return [0, Constant.TableViewRowHeight.workExperienceInfo].VResized.height
        case 3:
            return [0, Constant.TableViewRowHeight.educationInfo].VResized.height
        case 4:
            return UITableView.automaticDimension
        case 5:
            return [0, Constant.TableViewRowHeight.languageProficiencyInfo].VResized.height
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info = profileInfo[indexPath.section].info[indexPath.row]
        switch info {
        case .contact(let contactInfoModel):
            let cell: ProfileContactInfoTableViewCell = tableView.dequeueReusableCellAtIndexPath(indexPath: indexPath)
            cell.configure(contactInfo: contactInfoModel)
            return cell
        case .expectedSalary(let expectedSalaryInfoModel):
            let cell: ProfileExpectedSalaryInfoTableViewCell = tableView.dequeueReusableCellAtIndexPath(indexPath: indexPath)
            cell.configure(expectedSalaryInfo: expectedSalaryInfoModel)
            return cell
        case .workExperience(let workExperienceInfoModel):
            let cell: ProfileWorkExperienceInfoTableViewCell = tableView.dequeueReusableCellAtIndexPath(indexPath: indexPath)
            cell.configure(workExperienceInfo: workExperienceInfoModel)
            return cell
        case .education(let educationInfoModel):
            let cell: ProfileEducationInfoTableViewCell = tableView.dequeueReusableCellAtIndexPath(indexPath: indexPath)
            cell.configure(educationInfo: educationInfoModel)
            return cell
        case .keySkills:
            let profileInfoArray = profileInfo[indexPath.section].info
            let cell: ProfileKeySkillsInfoTableViewCell = tableView.dequeueReusableCellAtIndexPath(indexPath: indexPath)
            cell.prepareForReuse()
            cell.configure(profileInfoArray: profileInfoArray)
            return cell
        case .languageProficiency(let languageProficiencyInfoModel):
            let cell: ProfileLanguageProficiencyInfoTableViewCell = tableView.dequeueReusableCellAtIndexPath(indexPath: indexPath)
            cell.configure(languageProficiencyInfo: languageProficiencyInfoModel)
            return cell
        case .additionally:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return [0, Constant.TableSectionHeaderHeight.profileMain].VResized.height
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerModel = profileInfo[section].sectionHeader
        let headerView: ProfileMainTableSectionHeaderView = tableView.dequeueReusableHeaderFooterView()
        headerView.configure(model: headerModel, section: section)
        headerView.delegate = self
        return headerView
    }
}

// MARK: - IProfileMainHeaderViewDelegate

extension ProfileMainViewController: IProfileMainHeaderViewDelegate {
    func editProfileHandler() {
        eventClosure?(.editProfile)
    }
}

// MARK: -

extension ProfileMainViewController: IProfileMainTableSectionHeaderViewDelegate {
    func editInfoButtonHandler(tag: Int) {
        switch tag {
        case 2:
            eventClosure?(.workExperienceCell)
        default:
            break
        }
    }
}

// MARK: - Event

extension ProfileMainViewController {
    enum Event {
        case workExperienceCell
        case editProfile
    }
}
