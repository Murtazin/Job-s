//
//  AppCoordinator.swift
//  Jobs
//
//  Created by Renat Murtazin on 18.10.2022.
//

import UIKit

protocol IAppCoordinator: ICoordinator {
    func runMainFlow()
    func runAuthFlow()
}

final class AppCoordinator: IAppCoordinator {
    
    // MARK: - Properties
    weak var finishDelegate: ICoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators = [ICoordinator]()
    
    var type: CoordinatorType = .app
    
    // MARK: - Initializers
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Internal
    
    func start(completionHandler: ((UIViewController) -> Void)?) {
        runAuthFlow()
    }
    
    func runMainFlow() {
        let mainCoordinator: IMainCoordinator = MainCoordinator(navigationController: navigationController)
        mainCoordinator.finishDelegate = self
        mainCoordinator.start(completionHandler: nil)
        childCoordinators.append(mainCoordinator)
    }
    
    func runAuthFlow() {
        let authCoordinator: IAuthCoordinator = AuthCoordinator(navigationController: navigationController)
        authCoordinator.finishDelegate = self
        authCoordinator.start(completionHandler: nil)
        childCoordinators.append(authCoordinator)
    }
}

// MARK: - ICoordinatorFinishDelegate

extension AppCoordinator: ICoordinatorFinishDelegate {
    func childCoordinatorFinishedFlow(childCoordinator: ICoordinator) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })
        switch childCoordinator.type {
        case .auth:
            navigationController.viewControllers.removeAll()
            runMainFlow()
        case .main:
            navigationController.viewControllers.removeAll()
            runAuthFlow()
        default:
            break
        }
    }
}
