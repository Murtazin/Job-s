//
//  ICoordinator.swift
//  Jobs
//
//  Created by Renat Murtazin on 18.10.2022.
//

import UIKit

enum CoordinatorType {
    case app
    case auth
    case main
    case search
    case favourites
}

protocol ICoordinatorFinishDelegate: AnyObject {
    func childCoordinatorFinishedFlow(childCoordinator: ICoordinator)
}

protocol ICoordinator: AnyObject {
    var finishDelegate: ICoordinatorFinishDelegate? { get set }
    var navigationController: UINavigationController { get set }
    var childCoordinators: [ICoordinator] { get set }
    var type: CoordinatorType { get }
    
    init(navigationController: UINavigationController)
    
    func start(completionHandler: ((UIViewController) -> Void)?)
    func finish()
}

extension ICoordinator {
    func finish() {
        childCoordinators.removeAll()
        finishDelegate?.childCoordinatorFinishedFlow(childCoordinator: self)
    }
}
