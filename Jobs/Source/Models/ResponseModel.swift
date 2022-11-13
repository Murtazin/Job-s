//
//  ResponseModel.swift
//  Jobs
//
//  Created by Renat Murtazin on 13.11.2022.
//

import UIKit

enum ResponseStatus: String {
    case denied = "Вам отказано"
    case viewed = "Просмотрено"
    case notViewed = "Не просмотрено"
    case invited = "Вас пригласили"
}

struct ResponseModel {
    let companyLogoImage: UIImage
    let positionTitle: String
    let companyTitle: String
    let status: ResponseStatus
}
