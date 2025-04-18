//
//  HomeView.swift
//  SwiftUICoordinator
//
//  Created by dtrognn on 18/4/25.
//

import SwiftUI

struct HomeView: View {
    private var coordinator: HomeCoordinator

    var screenConfiguration: ScreenConfiguration {
        let screenConfiguration = ScreenConfiguration()
        screenConfiguration.showNaviBar = false
        screenConfiguration.hidesBottomBarWhenPushed = false
        return screenConfiguration
    }

    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }

    var body: some View {
        ScreenContainerView(screenConfiguration) {
            VStack(spacing: LayoutSize.mediumSpacing) {
                Text("HomeView")
                    .font(AppStyle.font.medium20)
                    .foregroundStyle(AppStyle.theme.textNormalColor)
                ScrollView {
                    LazyVStack {
                        ForEach(0 ... 50, id: \.self) { index in
                            let deviceName = "Device \(index)"
                            CommonButton(title: deviceName, action: {
                                coordinator.navigateToDeviceControl(.init(id: UUID().uuidString, name: deviceName))
                            })
                        }
                    }
                }
            }.padding(.all, LayoutSize.mediumPadding)
        }
    }
}
