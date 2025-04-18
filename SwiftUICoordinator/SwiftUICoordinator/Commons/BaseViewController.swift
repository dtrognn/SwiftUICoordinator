//
//  BaseViewController.swift
//  SwiftUICoordinator
//
//  Created by dtrognn on 17/4/25.
//

import SwiftUI
import UIKit

struct BaseViewControllerWrapView<Content: View>: UIViewControllerRepresentable {
    let content: Content
    let configuration: ScreenConfiguration

    init(configuration: ScreenConfiguration, content: @escaping () -> Content) {
        self.content = content()
        self.configuration = configuration
    }

    func makeUIViewController(context: Context) -> BaseViewController<Content> {
        return BaseViewController(rootView: content, configuration: configuration)
    }

    func updateUIViewController(_ uiViewController: BaseViewController<Content>, context: Context) {
        uiViewController.hostingController.rootView = content
    }

    typealias UIViewControllerType = BaseViewController
}

class BaseViewController<Content: View>: UIViewController {
    var hostingController: UIHostingController<Content>
    var configuration: ScreenConfiguration

    init(rootView: Content, configuration: ScreenConfiguration) {
        self.hostingController = UIHostingController(rootView: rootView)
        self.configuration = configuration
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.insetsLayoutMarginsFromSafeArea = false

        addChild(hostingController)
        view.addSubview(hostingController.view)

        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        configuration.onViewDidLoad?()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        OrientationManager.shared.currentBaseVC = nil
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configuration.onViewAppear?()

        OrientationManager.shared.currentBaseVC = self
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return configuration.supportedOrientations
    }
}

extension BaseViewController: OrientationConfigurable {
    var supportedOrientations: UIInterfaceOrientationMask {
        configuration.supportedOrientations
    }
}

final class OrientationManager {
    static var shared = OrientationManager()

    weak var currentBaseVC: OrientationConfigurable?

    private init() {}
}

protocol OrientationConfigurable: UIViewController {
    var supportedOrientations: UIInterfaceOrientationMask { get }
}
