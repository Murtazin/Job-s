//
//  ResponsesCoordinator.swift
//  Jobs
//
//  Created by Renat Murtazin on 23.10.2022.
//

import UIKit

protocol IResponsesCoordinator: ICoordinator {
    func runResponsesVC() -> UIViewController
}

final class ResponsesCoordinator: IResponsesCoordinator {

    // MARK: - Properties
    
    weak var finishDelegate: ICoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators = [ICoordinator]()
    
    var type: CoordinatorType = .responses
    
    // MARK: - Initializers
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Internal
    
    func start(completionHandler: ((UIViewController) -> Void)?) {
        let responsesVC = runResponsesVC()
        guard let completionHandler = completionHandler else {
            return
        }
        completionHandler(responsesVC)
    }
    
    func runResponsesVC() -> UIViewController {
        let responsesVC = ResponsesViewController()
        return responsesVC
    }
}
