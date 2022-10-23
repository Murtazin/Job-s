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
    
    private var rootViewController: UIViewController?
    
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
        let registerVC = AuthRegisterViewController { [weak self] event in
            guard let self = self else {
                return
            }
            switch event {
            case .register:
                self.finish()
            case .login:
                self.runLoginVC()
            }
        }
        rootViewController = registerVC
        navigationController.pushViewController(registerVC, animated: true)
    }
    
    func runLoginVC() {
        let loginVC = AuthLoginViewController { [weak self] event in
            switch event {
            case .login:
                self?.finish()
            case .forgotPassword:
                self?.runForgotPasswordVC()
            case .createAccount:
                self?.popToRootVC()
            }
        }
        navigationController.pushViewController(loginVC, animated: true)
    }
    
    func runForgotPasswordVC() {
        let forgotPasswordVC = AuthForgotPasswordViewController { [weak self] event in
            switch event {
            case .forgotPassword:
                self?.presentEmailSentAC()
            }
        }
        navigationController.pushViewController(forgotPasswordVC, animated: true)
    }
    
    func popToRootVC() {
        guard let rootViewController = rootViewController else {
            return
        }
        navigationController.popToViewController(rootViewController, animated: true)
    }
    
    func presentEmailSentAC() {
        let message = "Мы отправили письмо на указанный адрес электронной почты. Пожалуйста, перейдите по ссылке из письма для восстановления пароля."
        let emailSentAC = UIAlertController(title: "Письмо отправлено", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            self?.popToRootVC()
        }
        emailSentAC.addAction(okAction)
        navigationController.present(emailSentAC, animated: true)
    }
}
