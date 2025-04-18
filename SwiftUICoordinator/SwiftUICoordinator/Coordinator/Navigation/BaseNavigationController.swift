//
//  BaseNavigationController.swift
//  SwiftUICoordinator
//
//  Created by dtrognn on 18/4/25.
//

import UIKit

class BaseNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isTranslucent = false
        view.backgroundColor = .clear
        interactivePopGestureRecognizer?.isEnabled = true
        interactivePopGestureRecognizer?.delegate = self
    }

    static func instantiate(_ vc: UIViewController) -> BaseNavigationController {
        return BaseNavigationController(rootViewController: vc)
    }
}

extension BaseNavigationController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
