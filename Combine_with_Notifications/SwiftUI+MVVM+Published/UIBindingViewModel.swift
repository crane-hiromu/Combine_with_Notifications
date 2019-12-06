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
        NotificationCenter
            .Publisher(center: .default, name: UIDevice.orientationDidChangeNotification, object: nil)
            .map { _ in UIDevice.current.orientation.isLandscape }
            .sink { [weak self] isLandscape in
                print("---sink", isLandscape)
                self?.isLandscapeSubject.send(isLandscape)
            }
            .store(in: &cancellables)
    }
}
