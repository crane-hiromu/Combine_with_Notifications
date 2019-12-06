//
//  _UIBindingViewModel.swift
//  Combine_with_Notifications
//
//  Created by Hiromu Tsuruta on 2019/12/06.
//  Copyright © 2019 Hiromu Tsuruta. All rights reserved.
//

import UIKit
import Combine

/*
 Not working @Published on Protocol
 */

// MARK: - MVVM

protocol _UIBindingViewModelInputs: AnyObject {
    func onAppear()
}

protocol _UIBindingViewModelOutputs: AnyObject {
    var isLandscape: Bool { get }
}

protocol _UIBindingViewModelType: AnyObject {
    var iuputs: _UIBindingViewModelInputs { get }
    var outputs: _UIBindingViewModelOutputs { get }
}


// MARK: - ViewModel

typealias _UIBindingViewModelAdapter = _UIBindingViewModelType
                                     & _UIBindingViewModelInputs
                                     & _UIBindingViewModelOutputs

final class _UIBindingViewModel: ObservableObject, _UIBindingViewModelAdapter  {
    
    // MARK: Properties
    
    private var cancellables = Set<AnyCancellable>()
    
    
    // MARK: _UIBindingViewModelType
    
    var iuputs: _UIBindingViewModelInputs { self }
    var outputs: _UIBindingViewModelOutputs { self }
    
    
    // MARK: _UIBindingViewModelInputs
    
    func onAppear() {
        NotificationCenter
            .Publisher(center: .default, name: UIDevice.orientationDidChangeNotification, object: nil)
            .map { _ in UIDevice.current.orientation.isLandscape }
            .sink { [weak self] isLandscape in
                self?.isLandscape$.send(isLandscape)
            }
            .store(in: &cancellables)
        
        isLandscape$
            .map { $0 }
            .assign(to: \.isLandscape, on: self)
            .store(in: &cancellables)
    }
    
    
    // MARK: _UIBindingViewModelOutputs
    
    private let isLandscape$ = PassthroughSubject<Bool, Never>()
    @Published var isLandscape: Bool = false
}
