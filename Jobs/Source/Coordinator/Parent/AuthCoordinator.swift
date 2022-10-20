//
//  AuthCoordinator.swift
//  Jobs
//
//  Created by Renat Murtazin on 18.10.2022.
//

import UIKit

protocol IAuthCoordinator: ICoordinator {
    func runRegisterVC()
}

final class AuthCoordinator: IAuthCoordinator {
    
    // MARK: - Properties
    
    weak var finishDelegate: ICoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators = [ICoordinator]()
    
    var type: CoordinatorType = .auth
    
    // MARK: - Initializers
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Internal
    
    func start(completionHandler: ((UIViewController) -> Void)?) {
        runRegisterVC()
    }
    
    func runRegisterVC() {
        let registerVC = AuthRegisterViewController { [weak self] _ in
            self?.finish()
        }
        navigationController.pushViewController(registerVC, animated: true)
    }
}
