//
//  UIBindingViewModel.swift
//  Combine_with_Notifications
//
//  Created by Hiromu Tsuruta on 2019/12/06.
//  Copyright © 2019 Hiromu Tsuruta. All rights reserved.
//

import UIKit
import Combine

// MARK: - ViewModel

final class UIBindingViewModel: ObservableObject {
    
    // MARK: Properties
    
    private var cancellables = Set<AnyCancellable>()
    private let isLandscapeSubject = PassthroughSubject<Bool, Never>()
    
    
    // MARK: Outputs
    
    @Published var isLandscape: Bool = false
    
    
    // MARK: Inputs
    
    func onAppear() {
        isLandscapeSubject
            .map { $0 }
            .assign(to: \.isLandscape, on: self)
            .store(in: &cancellables)
    }
    
    func didChangeOrientation() {
        isLandscapeSubject.send(UIDevice.current.orientation.isLandscape)
    }
}
