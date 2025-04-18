//
//  ScreenConfiguration.swift
//  SwiftUICoordinator
//
//  Created by dtrognn on 17/4/25.
//

import SwiftUI

class NaviBarConfiguration: ObservableObject {
    @Published public var title: String = ""
    @Published public var showBackButton: Bool = true
    @Published public var showUnderline: Bool = true
    @Published public var setBackgroundColor: Bool = true

    public var coordinator: BaseCoordinator?

    public var rightButton: Image? = nil
    public var onBackAction: (() -> Void)?
    public var onSelectRightButton: (() -> Void)?

    public init() {}
}

class ScreenConfiguration: ObservableObject {
    @Published public var showNaviBar: Bool = true
    @Published public var naviBarConfiguration: NaviBarConfiguration = .init()
    @Published public var hidesBottomBarWhenPushed: Bool = true

    public var onViewDidLoad: (() -> Void)?
    public var onViewAppear: (() -> Void)?

    public var supportedOrientations: UIInterfaceOrientationMask = .portrait

    public init() {}
}
