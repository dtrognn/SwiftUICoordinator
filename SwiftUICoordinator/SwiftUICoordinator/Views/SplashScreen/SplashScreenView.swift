//
//  SplashScreenView.swift
//  SwiftUICoordinator
//
//  Created by dtrognn on 18/4/25.
//

import SwiftUI

struct SplashScreenView: View {
    private var coordinator: SplashScreenCoordinator

    private var screenConfiguration: ScreenConfiguration {
        let screenConfiguration = ScreenConfiguration()
        screenConfiguration.showNaviBar = false
        screenConfiguration.hidesBottomBarWhenPushed = false
        return screenConfiguration
    }

    init(coordinator: SplashScreenCoordinator) {
        self.coordinator = coordinator
    }

    var body: some View {
        ScreenContainerView(screenConfiguration) {
            VStack {
                Spacer()
                Text("SplashScreenView")
                    .font(AppStyle.font.medium20)
                    .foregroundStyle(AppStyle.theme.textNormalColor)
                Spacer()
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                coordinator.navigateToLogin()
            }
        }
    }
}
