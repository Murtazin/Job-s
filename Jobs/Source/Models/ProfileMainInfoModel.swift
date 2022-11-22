//
//  ProfileMainInfoModel.swift
//  Jobs
//
//  Created by Renat Murtazin on 16.11.2022.
//

import UIKit

struct ProfileMainContactInfoModel {
    let location: String
    let phoneNumber: String
    let mail: String
}

struct ProfileMainSalaryInfoModel {
    let sum: String
}

struct ProfileMainWorkExperienceInfoModel {
    let companyLogo: UIImage
    let companyTitle: String
    let position: String
    let duration: String
}

struct ProfileMainEducationInfoModel {
    let institutionLogo: UIImage
    let institutionTitle: String
    let faculty: String
    let duration: String
}

struct ProfileMainKeySkillsInfoModel {
    let description: String
}

struct ProfileMainLanguageProficiencyInfoModel {
    let countryFlag: UIImage
    let title: String
    let level: String
}

enum ProfileMainInfoType {
    case contact(ProfileMainContactInfoModel)
    case expectedSalary(ProfileMainSalaryInfoModel)
    case workExperience(ProfileMainWorkExperienceInfoModel)
    case education(ProfileMainEducationInfoModel)
    case keySkills(ProfileMainKeySkillsInfoModel)
    case languageProficiency(ProfileMainLanguageProficiencyInfoModel)
    case additionally
}

struct ProfileMainInfoSectionHeaderModel {
    let title: String
    let image: UIImage
    let editImage: UIImage
}

struct ProfileMainInfoModel {
    let sectionHeader: ProfileMainInfoSectionHeaderModel
    let info: [ProfileMainInfoType]
}
