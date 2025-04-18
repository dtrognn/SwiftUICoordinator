//
//  LoginView.swift
//  SwiftUICoordinator
//
//  Created by dtrognn on 17/4/25.
//

import SwiftUI

struct LoginView: View {
    private var coordinator: LoginCoordinator

    init(coordinator: LoginCoordinator) {
        self.coordinator = coordinator
    }

    private var screenConfiguration: ScreenConfiguration {
        let screenConfiguration = ScreenConfiguration()
        screenConfiguration.naviBarConfiguration.title = "Login View"
        screenConfiguration.naviBarConfiguration.showBackButton = false
        screenConfiguration.hidesBottomBarWhenPushed = false
        return screenConfiguration
    }

    var body: some View {
        ScreenContainerView(screenConfiguration) {
            VStack {
                Spacer()

                CommonButton(title: "Navigate to MainTab") {
                    coordinator.navigateToMainTab()
                }

                Spacer()
            }.padding(.horizontal, LayoutSize.mediumPadding)
        }
    }
}
