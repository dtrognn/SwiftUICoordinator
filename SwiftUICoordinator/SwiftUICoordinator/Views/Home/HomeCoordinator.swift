//
//  HomeCoordinator.swift
//  SwiftUICoordinator
//
//  Created by dtrognn on 18/4/25.
//

import SwiftUI

class HomeCoordinator: BaseCoordinator {
    override func start() {
        let homeView = HomeView(coordinator: self)
        let hostingController = UIHostingController(rootView: homeView)
        hostingController.hidesBottomBarWhenPushed = homeView.screenConfiguration.hidesBottomBarWhenPushed
        navigation.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        pushViewController(hostingController, animated: false)
    }
    
    func navigateToDeviceControl(_ deviceItemData: DeviceItemData) {
        let coordinator = DeviceControlCoordinator(navigation: navigation, deviceItemData: deviceItemData)
        coordinate(to: coordinator)
    }
}
