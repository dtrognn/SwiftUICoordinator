//
//  DeviceSettingCoordinator.swift
//  SwiftUICoordinator
//
//  Created by dtrognn on 18/4/25.
//

import SwiftUI

class DeviceSettingCoordinator: BaseCoordinator {
    private var deviceItemData: DeviceItemData

    init(navigation: BaseNavigationController, deviceItemData: DeviceItemData) {
        self.deviceItemData = deviceItemData
        super.init(navigation: navigation)
    }

    override func start() {
        let view = DeviceSettingView(coordinator: self, deviceItemData: deviceItemData)
        let hostingController = UIHostingController(rootView: view)
        hostingController.hidesBottomBarWhenPushed = view.screenConfiguration.hidesBottomBarWhenPushed
        pushViewController(hostingController)
    }
}
