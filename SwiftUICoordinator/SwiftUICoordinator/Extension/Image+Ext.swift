//
//  Image+Ext.swift
//  SwiftUICoordinator
//
//  Created by dtrognn on 18/4/25.
//

import SwiftUI

extension Image {
    func applyTheme(_ color: Color = AppStyle.theme.iconColor) -> some View {
        self.renderingMode(.template)
            .foregroundColor(color)
    }
}
