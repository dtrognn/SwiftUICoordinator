//
//  ScreenContainerView.swift
//  SwiftUICoordinator
//
//  Created by dtrognn on 17/4/25.
//

import SwiftUI

struct ScreenContainerView<Content: View>: View {
    @ObservedObject public var configuration: ScreenConfiguration
    public var content: () -> Content

    init(_ configuration: ScreenConfiguration, content: @escaping () -> Content) {
        self.configuration = configuration
        self.content = content
    }

    var body: some View {
        BaseViewControllerWrapView(configuration: configuration) {
            ZStack(alignment: .top) {
                AppStyle.theme.backgroundColor.ignoresSafeArea()

                VStack(spacing: .zero) {
                    if configuration.showNaviBar {
                        NaviBarView(configuration: configuration.naviBarConfiguration)
                    }

                    content()
                        .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
                        .navigationBarHidden(true)
//                        .toolbar(configuration.hidesBottomBarWhenPushed ? .hidden : .visible, for: .tabBar)
                        .onDisappear {
                            if configuration.hidesBottomBarWhenPushed == true {
                                configuration.hidesBottomBarWhenPushed = false
                            }
                        }
                }
            }
        }.ignoresSafeArea()
    }
}
