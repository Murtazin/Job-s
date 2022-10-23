//
//  ProfileCoordinator.swift
//  Jobs
//
//  Created by Renat Murtazin on 23.10.2022.
//

import UIKit

protocol IProfileCoordinator: ICoordinator {
    func runProfileVC() -> UIViewController
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
        let profileVC = runProfileVC()
        guard let completionHandler = completionHandler else {
            return
        }
        completionHandler(profileVC)
    }
    
    func runProfileVC() -> UIViewController {
        let profileVC = ProfileViewController()
        return profileVC
    }
}
