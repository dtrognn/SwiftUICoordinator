//
//  LoginCoordinator.swift
//  SwiftUICoordinator
//
//  Created by dtrognn on 18/4/25.
//

import SwiftUI

class LoginCoordinator: BaseCoordinator {
    override func start() {
        let loginView = LoginView(coordinator: self)
        let hostingController = UIHostingController(rootView: loginView)
//        pushViewController(hostingController)
        navigation.viewControllers = [hostingController]
    }

    func navigateToMainTab() {
        if let appCoordinator = parentCoordinator as? AppCoordinator {
            appCoordinator.startMainScreen()
            parentCoordinator?.didFinish(coordinator: self)
        }
    }
}
