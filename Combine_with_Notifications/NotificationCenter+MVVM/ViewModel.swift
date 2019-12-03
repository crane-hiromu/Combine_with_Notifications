//
//  ViewModel.swift
//  Combine_with_Notifications
//
//  Created by admin on 2019/12/03.
//  Copyright © 2019 Hiromu Tsuruta. All rights reserved.
//

import UIKit
import Combine

// MARK: - MVVM

protocol ViewModelInputs {
    func didChangeOrientation(notification: Notification)
}

protocol ViewModelOutputs {
    var isLandscape: AnyPublisher<Bool, Never> { get }
}

protocol ViewModelType {
    var inputs: ViewModelInputs { get }
    var outputs: ViewModelOutputs { get }
}

// MARK: - ViewModel

class ViewModel: ViewModelType, ViewModelInputs, ViewModelOutputs {
    
    // MARK: ViewModelType
    
    var inputs: ViewModelInputs { self }
    var outputs: ViewModelOutputs { self }
    
    
    // MARK: ViewModelOutputs
    
    private let _isLandscape = PassthroughSubject<Bool, Never>()
    var isLandscape: AnyPublisher<Bool, Never> {
        _isLandscape.eraseToAnyPublisher()
    }
    
    
    //MARK: ViewModelInputs
    
    func didChangeOrientation(notification: Notification) {
        _isLandscape.send(UIDevice.current.orientation.isLandscape)
    }
}
