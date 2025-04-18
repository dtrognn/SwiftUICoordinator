//
//  ProfileView.swift
//  SwiftUICoordinator
//
//  Created by dtrognn on 18/4/25.
//

import SwiftUI

struct ProfileView: View {
    private var coordinator: ProfileCoordinator

    init(coordinator: ProfileCoordinator) {
        self.coordinator = coordinator
    }

    var screenConfiguration: ScreenConfiguration {
        let screenConfiguration = ScreenConfiguration()
        screenConfiguration.showNaviBar = false
        screenConfiguration.hidesBottomBarWhenPushed = false
        return screenConfiguration
    }

    var body: some View {
        ScreenContainerView(screenConfiguration) {
            VStack {
                Spacer()

                VStack(spacing: LayoutSize.mediumSpacing) {
                    Text("ProfileView")
                        .font(AppStyle.font.medium20)
                        .foregroundStyle(AppStyle.theme.textNormalColor)

                    CommonButton(title: "Logout") {
                        coordinator.navigateToLogin()
                    }
                }.padding(.horizontal, LayoutSize.mediumPadding)

                Spacer()
            }
        }
    }
}
