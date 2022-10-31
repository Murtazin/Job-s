//
//  SearchCoordinator.swift
//  Jobs
//
//  Created by Renat Murtazin on 18.10.2022.
//

import UIKit

protocol ISearchCoordinator: ICoordinator {
    func runSearchVC() -> UIViewController
}

final class SearchCoordinator: ISearchCoordinator {

    // MARK: - Properties
    
    weak var finishDelegate: ICoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators = [ICoordinator]()
    
    var type: CoordinatorType = .search
    
    // MARK: - Initializers
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Internal
    
    func start(completionHandler: ((UIViewController) -> Void)?) {
        navigationController.navigationBar.prefersLargeTitles = false
        let searchVC = presentFilterVC()
        guard let completionHandler = completionHandler else {
            return
        }
        completionHandler(searchVC)
    }
    
    func runSearchVC() -> UIViewController {
        let searchVC = SearchMainViewController()
        return searchVC
    }
    
    func presentFilterVC() -> UIViewController {
        let filterVC = SearchFilterViewController()
        return filterVC
    }
}
