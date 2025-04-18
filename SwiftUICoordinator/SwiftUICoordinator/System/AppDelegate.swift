//
//  AppDelegate.swift
//  SwiftUICoordinator
//
//  Created by dtrognn on 17/4/25.
//

import SwiftUI
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private var coordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        window = UIWindow(frame: UIScreen.main.bounds)

        coordinator = AppCoordinator(window: window!)
        coordinator?.start()

        return true
    }

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return OrientationManager.shared.currentBaseVC?.supportedOrientations ?? .all
    }

    func logViewControllerHierarchy(vc: UIViewController?, level: Int = 0) {
        guard let vc = vc else { return }
        print(String(repeating: "  ", count: level) + "\(type(of: vc))")
        for child in vc.children {
            logViewControllerHierarchy(vc: child, level: level + 1)
        }
        if let presented = vc.presentedViewController {
            print(String(repeating: "  ", count: level) + "↳ presented:")
            logViewControllerHierarchy(vc: presented, level: level + 1)
        }
    }
}

extension UIViewController {
    func topMostViewController() -> UIViewController {
        if let presented = presentedViewController {
            return presented.topMostViewController()
        }
        if let nav = self as? UINavigationController {
            return nav.visibleViewController?.topMostViewController() ?? nav
        }
        if let tab = self as? UITabBarController {
            return tab.selectedViewController?.topMostViewController() ?? tab
        }
        // nếu có child (như UIHostingController), duyệt tiếp
        for child in children.reversed() {
            return child.topMostViewController()
        }
        return self
    }
}
