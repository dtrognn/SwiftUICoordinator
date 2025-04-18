//
//  BaseViewModel.swift
//  SwiftUICoordinator
//
//  Created by dtrognn on 18/4/25.
//

import Combine

open class BaseViewModel: ObservableObject {
    var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        initData()
        makeSubscription()
        print("AAA \(String(describing: Self.self)) INIT")
    }
    
    deinit {
        print("AAA \(String(describing: Self.self)) DEINIT")
    }
    
    open func initData() {
        
    }
    
    open func makeSubscription() {
        
    }
}
