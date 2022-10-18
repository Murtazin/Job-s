//
//  FavouritesCoordinator.swift
//  Jobs
//
//  Created by Renat Murtazin on 18.10.2022.
//

import UIKit

protocol IFavouritesCoordinator: ICoordinator {
    func runFavouritesVC() -> UIViewController
}

final class FavouritesCoordinator: IFavouritesCoordinator {

    // MARK: - Properties
    
    weak var finishDelegate: ICoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators = [ICoordinator]()
    
    var type: CoordinatorType = .favourites
    
    // MARK: - Initializers
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Internal
    
    func start(completionHandler: ((UIViewController) -> Void)?) {
        let favouritesVC = runFavouritesVC()
        guard let completionHandler = completionHandler else {
            return
        }
        completionHandler(favouritesVC)
    }
    
    func runFavouritesVC() -> UIViewController {
        let favouritesVC = FavouritesViewController()
        return favouritesVC
    }
}
