//
//  DeviceControlView.swift
//  SwiftUICoordinator
//
//  Created by dtrognn on 18/4/25.
//

import SwiftUI

struct DeviceControlView: View {
    private var coordinator: DeviceControlCoordinator
    private var deviceItemData: DeviceItemData

    @StateObject private var vM = DeviceControlVM()

    var screenConfiguration: ScreenConfiguration {
        let screenConfiguration = ScreenConfiguration()
        screenConfiguration.showNaviBar = true
        screenConfiguration.hidesBottomBarWhenPushed = true
        screenConfiguration.naviBarConfiguration.coordinator = coordinator
        screenConfiguration.naviBarConfiguration.title = deviceItemData.name
        screenConfiguration.supportedOrientations = .all

        screenConfiguration.onViewDidLoad = {
            print("AAA DeviceControlView onViewDidLoad")
        }

        screenConfiguration.onViewAppear = {
            print("AAA DeviceControlView onViewAppear")
        }
        return screenConfiguration
    }

    init(coordinator: DeviceControlCoordinator, deviceItemData: DeviceItemData) {
        self.coordinator = coordinator
        self.deviceItemData = deviceItemData
    }

    var body: some View {
        ScreenContainerView(screenConfiguration) {
            VStack {
                Spacer()

                VStack {
                    TextField("Enter value", text: $vM.tfValue)
                        .textFieldStyle(.roundedBorder)

                    CommonButton(title: "Navigate to setting") {
                        coordinator.navigateToSetting(deviceItemData)
                    }
                }

                Spacer()
            }.padding(.horizontal, LayoutSize.mediumPadding)
        }
    }
}
