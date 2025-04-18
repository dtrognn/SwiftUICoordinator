//
//  AppCoordinator.swift
//  SwiftUICoordinator
//
//  Created by dtrognn on 18/4/25.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    var window: UIWindow

    init(window: UIWindow) {
        self.window = window
        super.init()
    }

    override func start() {
        startSplashScreen()
    }

    func startSplashScreen() {
        let coordinator = SplashScreenCoordinator(navigation: BaseNavigationController())
        coordinate(to: coordinator)
        setRootViewController(coordinator.navigation)
    }

    func startLoginScreen() {
        let loginCoordinator = LoginCoordinator(navigation: BaseNavigationController())
        coordinate(to: loginCoordinator)
        setRootViewController(loginCoordinator.navigation)
    }

    func startMainScreen() {
        let mainCoordinator = MainTabCoordinator(navigation: BaseNavigationController())
        coordinate(to: mainCoordinator)
        setRootViewController(mainCoordinator.tabBarController)
    }

    private func setRootViewController(_ viewController: UIViewController) {
        UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.window.rootViewController = viewController
            self.window.makeKeyAndVisible()
        }, completion: nil)
        UINavigationBar.appearance().isHidden = true
    }
}
