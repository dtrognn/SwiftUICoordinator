//
//  NaviBarView.swift
//  SwiftUICoordinator
//
//  Created by dtrognn on 17/4/25.
//

import SwiftUI

struct NaviBarView: View {
    @ObservedObject private var configuration: NaviBarConfiguration

    init(configuration: NaviBarConfiguration) {
        self.configuration = configuration
    }

    var body: some View {
        VStack(spacing: LayoutSize.zeroSpacing) {
            HStack(spacing: LayoutSize.mediumSpacing) {
                backButton
                Spacer()
                titleText
                Spacer()
                rightButton
            }

            if configuration.showUnderline {
                Divider()
                    .frame(height: 1)
            }
        }.frame(height: LayoutSize.buttonHeightMedium)
            .navigationBarHidden(true)
    }
}

private extension NaviBarView {
    var backButton: some View {
        if configuration.showBackButton {
            return Button {
                if configuration.onBackAction == nil {
                    configuration.coordinator?.popViewController(animated: true)
                } else {
                    configuration.onBackAction?()
                }
            } label: {
                Image("ic_back")
                    .applyTheme(AppStyle.theme.naviBackIconColor)
                    .scaleEffect(1.3)
                    .frame(width: LayoutSize.buttonHeightMedium, height: LayoutSize.buttonHeightMedium)
            }.asAnyView
        }
        return Spacer()
            .frame(width: LayoutSize.buttonHeightMedium, height: LayoutSize.buttonHeightMedium)
            .asAnyView
    }

    var titleText: some View {
        return Text(configuration.title)
            .font(AppStyle.font.semibold16)
            .foregroundStyle(AppStyle.theme.naviTextColor)
            .lineLimit(1)
    }

    var rightButton: some View {
        if let rightImage = configuration.rightButton {
            return Button {
                configuration.onSelectRightButton?()
            } label: {
                rightImage
                    .applyTheme(AppStyle.theme.naviBackIconColor)
                    .frame(width: LayoutSize.buttonHeightMedium, height: LayoutSize.buttonHeightMedium)
            }.asAnyView
        } else {
            return Spacer()
                .frame(width: LayoutSize.buttonHeightMedium, height: LayoutSize.buttonHeightMedium)
                .asAnyView
        }
    }
}
