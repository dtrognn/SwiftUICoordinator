//
//  Coordinator.swift
//  SwiftUICoordinator
//
//  Created by dtrognn on 17/4/25.
//

import Combine
import UIKit

protocol Coordinator: AnyObject {
    var navigation: BaseNavigationController { get set }
    var parentCoordinator: Coordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
    var data: Any? { get set }

    func start()
    func didFinish(coordinator: Coordinator)
}

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
        if coordinator.data == nil {
            coordinator.data = data
        }
        coordinator.start()
    }
}

class BaseCoordinator: Coordinator {
    var navigation: BaseNavigationController
    weak var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var cancellableSet: Set<AnyCancellable> = []
    var data: Any?

    init(navigation: BaseNavigationController = BaseNavigationController()) {
        navigation.isNavigationBarHidden = true
        self.navigation = navigation
    }

    func start() {
        fatalError("Start method must be implemented")
    }

    func didFinish(coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }

    func popViewController(animated: Bool = true) {
        navigation.popViewController(animated: animated)
    }

    func popToRootViewController(animated: Bool = true) {
        navigation.popToRootViewController(animated: animated)
    }

    func pushViewController(_ vc: UIViewController, animated: Bool = true) {
        navigation.pushViewController(vc, animated: animated)
    }

    func present(_ vc: UIViewController, animated: Bool = true) {
        navigation.present(vc, animated: animated, completion: nil)
    }
}
