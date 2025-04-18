//
//  DeviceSettingView.swift
//  SwiftUICoordinator
//
//  Created by dtrognn on 18/4/25.
//

import SwiftUI

struct DeviceSettingView: View {
    private var coordinator: DeviceSettingCoordinator
    private var deviceItemData: DeviceItemData

    var screenConfiguration: ScreenConfiguration {
        let screenConfiguration = ScreenConfiguration()
        screenConfiguration.showNaviBar = true
        screenConfiguration.hidesBottomBarWhenPushed = true
        screenConfiguration.naviBarConfiguration.coordinator = coordinator
        screenConfiguration.naviBarConfiguration.title = "\(deviceItemData.name) setting"
        return screenConfiguration
    }

    init(coordinator: DeviceSettingCoordinator, deviceItemData: DeviceItemData) {
        self.coordinator = coordinator
        self.deviceItemData = deviceItemData
    }

    var body: some View {
        ScreenContainerView(screenConfiguration) {
            VStack {
                Spacer()

                CommonButton(title: "Pop to root") {
                    coordinator.popToRootViewController(animated: true)
                }

                Spacer()
            }.padding(.horizontal, LayoutSize.mediumPadding)
        }
    }
}
