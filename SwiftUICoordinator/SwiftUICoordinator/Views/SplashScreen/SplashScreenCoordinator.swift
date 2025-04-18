//
//  SplashScreenCoordinator.swift
//  SwiftUICoordinator
//
//  Created by dtrognn on 18/4/25.
//

import SwiftUI

class SplashScreenCoordinator: BaseCoordinator {
    override func start() {
        let view = SplashScreenView(coordinator: self)
        let hostingController = UIHostingController(rootView: view)
//        pushViewController(hostingController)
        navigation.viewControllers = [hostingController]
    }

    func navigateToLogin() {
        if let appCoordinator = parentCoordinator as? AppCoordinator {
            appCoordinator.startLoginScreen()
            parentCoordinator?.didFinish(coordinator: self)
        }
    }
}
