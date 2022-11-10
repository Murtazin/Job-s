//
//  MainCoordinator.swift
//  Jobs
//
//  Created by Renat Murtazin on 18.10.2022.
//

import UIKit

enum TabBarPage {
    case search
    case favourites
    case responses
    case messages
    case profile
    
    init?(index: Int) {
        switch index {
        case 0:
            self = .search
        case 1:
            self = .favourites
        case 2:
            self = .responses
        case 3:
            self = .messages
        case 4:
            self = .profile
        default:
            return nil
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .search:
            return "Поиск"
        case .favourites:
            return "Избранное"
        case .responses:
            return "Отклики"
        case .messages:
            return "Сообщения"
        case .profile:
            return "Профиль"
        }
    }
    
    func pageOrderNumber() -> Int {
        switch self {
        case .search:
            return 0
        case .favourites:
            return 1
        case .responses:
            return 2
        case .messages:
            return 3
        case .profile:
            return 4
        }
    }
    
    func pageIcon() -> UIImage? {
        switch self {
        case .search:
            return Constant.Image.System.searchTabBarItemImage
        case .favourites:
            return Constant.Image.System.favouritesTabBarItemImage
        case .responses:
            return Constant.Image.System.responsesTabBarItemImage
        case .messages:
            return Constant.Image.System.messagesTabBarItemImage
        case .profile:
            return Constant.Image.System.profileTabBarItemImage
        }
    }
}

protocol IMainCoordinator: ICoordinator {
    var tabBarController: UITabBarController { get set }
    
    func currentPage() -> TabBarPage?
    func selectPage(_ page: TabBarPage)
    func setSelectedIndex(_ index: Int)
}

final class MainCoordinator: IMainCoordinator {
    
    // MARK: - Properties
    
    weak var finishDelegate: ICoordinatorFinishDelegate?
    
    var tabBarController = UITabBarController()
    
    var navigationController: UINavigationController
    
    var childCoordinators = [ICoordinator]()
    
    var type: CoordinatorType = .main
    
    // MARK: - Initializers
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Internal
    
    func start(completionHandler: ((UIViewController) -> Void)?) {
        let pages: [TabBarPage] = [.search, .favourites, .responses, .messages, .profile]
            .sorted(by: { $0.pageOrderNumber() < $1.pageOrderNumber() })
        
        let controllers: [UINavigationController] = pages.map({ obtainTabBarController($0) })
        
        setupTabBarController(withTabBarControllers: controllers)
    }
    
    // MARK: - Private
    
    private func setupTabBarController(withTabBarControllers tabBarControllers: [UIViewController]) {
        tabBarController.setViewControllers(tabBarControllers, animated: true)
        tabBarController.selectedIndex = TabBarPage.search.pageOrderNumber()
        tabBarController.tabBar.tintColor = .systemBlue
        tabBarController.tabBar.backgroundColor = .systemBackground
        
        navigationController.viewControllers = [tabBarController]
    }
    
    private func obtainTabBarController(_ page: TabBarPage) -> UINavigationController {
        
        let navigationController = UINavigationController()
        navigationController.tabBarItem = UITabBarItem.init(title: page.pageTitleValue(),
                                                            image: page.pageIcon(),
                                                            tag: page.pageOrderNumber())
        self.navigationController.isNavigationBarHidden = true
        
        switch page {
        case .search:
            let searchCoordinator: ISearchCoordinator = SearchCoordinator(navigationController: navigationController)
            searchCoordinator.finishDelegate = self
            searchCoordinator.start { viewController in
                navigationController.pushViewController(viewController, animated: true)
                navigationController.navigationBar.prefersLargeTitles = true
            }
            childCoordinators.append(searchCoordinator)
        case .favourites:
            let favouritesCoordinator: IFavouritesCoordinator = FavouritesCoordinator(navigationController: navigationController)
            favouritesCoordinator.finishDelegate = self
            favouritesCoordinator.start { viewController in
                navigationController.pushViewController(viewController, animated: true)
            }
            childCoordinators.append(favouritesCoordinator)
        case .responses:
            let responsesCoordinator: IResponsesCoordinator = ResponsesCoordinator(navigationController: navigationController)
            responsesCoordinator.finishDelegate = self
            responsesCoordinator.start { viewController in
                navigationController.pushViewController(viewController, animated: true)
            }
            childCoordinators.append(responsesCoordinator)
        case .messages:
            let messagesCoordinator: IMessagesCoordinator = MessagesCoordinator(navigationController: navigationController)
            messagesCoordinator.finishDelegate = self
            messagesCoordinator.start { viewController in
                navigationController.pushViewController(viewController, animated: true)
                navigationController.navigationBar.prefersLargeTitles = true
            }
            childCoordinators.append(messagesCoordinator)
        case .profile:
            let profileCoordinator: IProfileCoordinator = ProfileCoordinator(navigationController: navigationController)
            profileCoordinator.finishDelegate = self
            profileCoordinator.start { viewController in
                navigationController.pushViewController(viewController, animated: true)
//                navigationController.isNavigationBarHidden = true
            }
            childCoordinators.append(profileCoordinator)
        }
        return navigationController
    }
    
    // MARK: - Internal
    
    func currentPage() -> TabBarPage? { TabBarPage.init(index: tabBarController.selectedIndex) }
    
    func selectPage(_ page: TabBarPage) {
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
    
    func setSelectedIndex(_ index: Int) {
        guard let page = TabBarPage.init(index: index) else { return }
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
    
}

// MARK: - ICoordinatorFinishDelegate

extension MainCoordinator: ICoordinatorFinishDelegate {
    func childCoordinatorFinishedFlow(childCoordinator: ICoordinator) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })
        navigationController.viewControllers.removeAll()
    }
}
