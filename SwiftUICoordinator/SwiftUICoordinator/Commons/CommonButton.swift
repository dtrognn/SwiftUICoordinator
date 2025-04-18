//
//  CommonButton.swift
//  SwiftUICoordinator
//
//  Created by dtrognn on 18/4/25.
//

import SwiftUI

struct CommonButton: View {
    private var title: String
    private var action: () -> Void

    init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }

    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1)
                )
        }
    }
}
