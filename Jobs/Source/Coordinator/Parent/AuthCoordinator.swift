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
        runForgotPasswordVC()
    }
    
    func runRegisterVC() {
        let registerVC = AuthRegisterViewController { [weak self] event in
            switch event {
            case .register:
                self?.finish()
            case .login:
                self?.runLoginVC()
            }
        }
        navigationController.pushViewController(registerVC, animated: true)
    }
    
    func runLoginVC() {
        let loginVC = AuthLoginViewController { [weak self] event in
            switch event {
            case .login:
                self?.finish()
            }
        }
        navigationController.pushViewController(loginVC, animated: true)
    }
    
    func runForgotPasswordVC() {
        let forgotPasswordVC = AuthForgotPasswordViewController()
        navigationController.pushViewController(forgotPasswordVC, animated: true)
    }
}
