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
            }
        }
        return profileVC
    }
    
    func runProfileEditVC() {
        let profileEditVC = ProfileEditViewController()
        navigationController.pushViewController(profileEditVC, animated: true)
    }
}
