//
//  ViewController.swift
//  Combine_with_Notifications
//
//  Created by Hiromu Tsuruta on 2019/12/02.
//  Copyright © 2019 Hiromu Tsuruta. All rights reserved.
//

import UIKit
import Combine

// MARK: - Controller

final class ViewController: UIViewController {
    
    // MARK: Propepties
    
    private var cancellables: Set<AnyCancellable> = []
    private var viewModel: ViewModel = ViewModel()
    
    
    // MARK: Overrides

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// input
        NotificationCenter
            .Publisher(center: .default, name: UIDevice.orientationDidChangeNotification, object: nil)
            .sink { [weak self] notification in
                self?.viewModel.inputs.didChangeOrientation(notification: notification)
            }
            .store(in: &cancellables)
        
        /// output
        viewModel.outputs.isLandscape
            .sink { isLandscape in
                print("isLandscape: \(isLandscape)")
            }
            .store(in: &cancellables)
    }
}
