//
//  ProfileCoordinator.swift
//  SwiftUICoordinator
//
//  Created by dtrognn on 18/4/25.
//

import SwiftUI

class ProfileCoordinator: BaseCoordinator {
    override func start() {
        let profileView = ProfileView(coordinator: self)
        let hostingController = UIHostingController(rootView: profileView)
        hostingController.hidesBottomBarWhenPushed = profileView.screenConfiguration.hidesBottomBarWhenPushed

        navigation.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 1)
        pushViewController(hostingController, animated: false)
        print("JJJ \(String(describing: Self.self)) start")
    }

    func navigateToLogin() {
        if let appCoordinator = parentCoordinator as? MainTabCoordinator {
            appCoordinator.navigateToLogin()
            parentCoordinator?.didFinish(coordinator: self)
        }
    }
}
