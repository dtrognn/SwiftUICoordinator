//
//  MainTabCoordinator.swift
//  SwiftUICoordinator
//
//  Created by dtrognn on 18/4/25.
//

import SwiftUI

class MainTabCoordinator: BaseCoordinator {
    var tabBarController: UITabBarController

    override init(navigation: BaseNavigationController = BaseNavigationController()) {
        self.tabBarController = UITabBarController()
        super.init(navigation: navigation)
        configurationTabbar()
    }

    override func start() {
        let homeNavigation = BaseNavigationController()
        let homeCoordinator = HomeCoordinator(navigation: homeNavigation)
        coordinate(to: homeCoordinator)

        let profileNavigation = BaseNavigationController()
        let profileCoordinator = ProfileCoordinator(navigation: profileNavigation)
        coordinate(to: profileCoordinator)

        tabBarController.viewControllers = [homeNavigation, profileNavigation]
    }

    func navigateToLogin() {
        if let appCoordinator = parentCoordinator as? AppCoordinator {
            appCoordinator.startLoginScreen()
            parentCoordinator?.didFinish(coordinator: self)
        }
    }

    private func configurationTabbar() {
        let appearance = UITabBarAppearance()

        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = AppStyle.theme.tabbarBackgroundViewColor.asUIColor()

        appearance.shadowImage = nil
        appearance.shadowColor = nil
        appearance.backgroundEffect = nil

        tabBarController.tabBar.standardAppearance = appearance
        tabBarController.tabBar.scrollEdgeAppearance = appearance

        tabBarController.view.backgroundColor = .clear
        tabBarController.tabBar.backgroundColor = .clear
        tabBarController.tabBar.isTranslucent = true

        tabBarController.tabBar.tintColor = AppStyle.theme.iconColor.asUIColor()
    }
}
