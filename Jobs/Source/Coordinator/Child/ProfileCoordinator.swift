//
//  ProfileCoordinator.swift
//  Jobs
//
//  Created by Renat Murtazin on 23.10.2022.
//

import UIKit

protocol IProfileCoordinator: ICoordinator {
    func runProfileMainVC() -> UIViewController
    func runProfileEditVC()
}

final class ProfileCoordinator: IProfileCoordinator {
    
    // MARK: - Private properties
    
    private var rootViewController: UIViewController?

    // MARK: - Properties
    
    weak var finishDelegate: ICoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators = [ICoordinator]()
    
    var type: CoordinatorType = .profile
    
    // MARK: - Initializers
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Internal
    
    func start(completionHandler: ((UIViewController) -> Void)?) {
        let profileVC = runProfileMainVC()
        guard let completionHandler = completionHandler else {
            return
        }
        completionHandler(profileVC)
    }
    
    func runProfileMainVC() -> UIViewController {
        let profileVC = ProfileMainViewController { [weak self] event in
            guard let self = self else { return }
            switch event {
            case .editProfile:
                self.runProfileEditVC()
            case .workExperienceCell:
                self.runProfileEditWorkExperienceVC()
            }
        }
        rootViewController = profileVC
        return profileVC
    }
    
    func runProfileEditVC() {
        let profileEditVC = ProfileEditViewController()
        navigationController.pushViewController(profileEditVC, animated: true)
    }
    
    func runProfileEditWorkExperienceVC() {
        let profileEditWEVC = ProfileEditWorkExperienceViewController { [weak self] event in
            guard let self = self,
                  let rootViewController = self.rootViewController as? ProfileMainViewController else {
                return
            }
            switch event {
            case .save(let data):
                let workExperienceView = WorkExperienceView(model: data)
                rootViewController.updateInfoViews(view: workExperienceView)
                self.navigationController.popToViewController(rootViewController, animated: true)
            case .fillAllFields:
                self.presentFillAllFieldsAlert()
            }
        }
        navigationController.pushViewController(profileEditWEVC, animated: true)
    }
    
    func presentFillAllFieldsAlert() {
        let fillAllFieldsAC = UIAlertController(title: "Не удается сохранить данные", message: "Сначала заполните все поля", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            guard let self = self else { return }
            self.navigationController.dismiss(animated: true)
        }
        fillAllFieldsAC.addAction(okAction)
        navigationController.present(fillAllFieldsAC, animated: true)
    }
}
