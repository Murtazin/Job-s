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
    
    // MARK: - Private properties
    
    private var rootViewController: UIViewController?

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
        let searchVC = runSearchVC()
        guard let completionHandler = completionHandler else {
            return
        }
        rootViewController = searchVC
        completionHandler(searchVC)
    }
    
    func runSearchVC() -> UIViewController {
        let searchVC = SearchMainViewController { [weak self] event in
            guard let self = self else { return }
            switch event {
            case .filter:
                self.presentFilterVC()
            }
        }
        return searchVC
    }
    
    func presentFilterVC() {
        let filterVC = SearchFilterViewController { [weak self] event in
            guard let self = self else { return }
            switch event {
            case .close:
                self.navigationController.dismiss(animated: true)
            default:
                break
            }
        }
        filterVC.modalPresentationStyle = .fullScreen
        navigationController.present(filterVC, animated: true)
    }
}
