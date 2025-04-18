//
//  DeviceControlCoordinator.swift
//  SwiftUICoordinator
//
//  Created by dtrognn on 18/4/25.
//

import SwiftUI

class DeviceItemData: Identifiable {
    var id: String = UUID().uuidString
    var name: String

    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}

class DeviceControlCoordinator: BaseCoordinator {
    private var deviceItemData: DeviceItemData

    init(navigation: BaseNavigationController, deviceItemData: DeviceItemData) {
        self.deviceItemData = deviceItemData
        super.init(navigation: navigation)
    }

    override func start() {
        let view = DeviceControlView(coordinator: self, deviceItemData: deviceItemData)
        let hostingController = UIHostingController(rootView: view)
        hostingController.hidesBottomBarWhenPushed = view.screenConfiguration.hidesBottomBarWhenPushed
        pushViewController(hostingController)
    }

    func navigateToSetting(_ deviceItemData: DeviceItemData) {
        let coordinator = DeviceSettingCoordinator(navigation: navigation, deviceItemData: deviceItemData)
        coordinate(to: coordinator)
    }
}
