//
//  MessagesCoordinator.swift
//  Jobs
//
//  Created by Renat Murtazin on 23.10.2022.
//

import UIKit

protocol IMessagesCoordinator: ICoordinator {
    func runMessagesVC() -> UIViewController
}

final class MessagesCoordinator: IMessagesCoordinator {

    // MARK: - Properties
    
    weak var finishDelegate: ICoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators = [ICoordinator]()
    
    var type: CoordinatorType = .messages
    
    // MARK: - Initializers
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Internal
    
    func start(completionHandler: ((UIViewController) -> Void)?) {
        let messagesVC = runMessagesVC()
        guard let completionHandler = completionHandler else {
            return
        }
        completionHandler(messagesVC)
    }
    
    func runMessagesVC() -> UIViewController {
        let messagesVC = MessagesViewController()
        return messagesVC
    }
}
