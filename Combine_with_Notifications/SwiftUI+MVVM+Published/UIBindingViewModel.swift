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
    
    
    // MARK: Outputs
    
    private let isLandscape$ = PassthroughSubject<Bool, Never>()
    @Published var isLandscape: Bool = false
    
    
    // MARK: Inputs
    
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
}
