//
//  UIViewModel.swift
//  Combine_with_Notifications
//
//  Created by admin on 2019/12/04.
//  Copyright © 2019 Hiromu Tsuruta. All rights reserved.
//

import UIKit
import Combine

// MARK: - MVVM

protocol UIViewModelInputs: AnyObject {
    func didChangeOrientation(notification: Notification)
    func willStore(cancellable: AnyCancellable)
}

protocol UIViewModelOutputs: AnyObject {
    var isLandscape: AnyPublisher<Bool, Never> { get }
}

protocol UIViewModelType: AnyObject {
    var inputs: UIViewModelInputs { get }
    var outputs: UIViewModelOutputs { get }
}


// MARK: - ViewModel

class UIViewModel: UIViewModelType, UIViewModelInputs, UIViewModelOutputs {
    
    // MARK: UIViewModelType
    
    var inputs: UIViewModelInputs { self }
    var outputs: UIViewModelOutputs { self }
    
    
    // MARK: UIViewModelOutputs
    
    private let _isLandscape = PassthroughSubject<Bool, Never>()
    var isLandscape: AnyPublisher<Bool, Never> {
        _isLandscape.eraseToAnyPublisher()
    }
    
    
    //MARK: UIViewModelInputs
        
    func didChangeOrientation(notification: Notification) {
        _isLandscape.send(UIDevice.current.orientation.isLandscape)
    }
    
    private var cancellables: Set<AnyCancellable> = []
    func willStore(cancellable: AnyCancellable) {
        cancellable.store(in: &cancellables)
    }
}

