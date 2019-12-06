//
//  SwiftUIBindingView.swift
//  Combine_with_Notifications
//
//  Created by Hiromu Tsuruta on 2019/12/06.
//  Copyright © 2019 Hiromu Tsuruta. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - UIView

struct SwiftUIBindingView: View {
    
    // MARK: Properties
    
    @ObservedObject var viewModel: UIBindingViewModel
    
    
    // MARK: View

    var body: some View {
        EmptyView()
            .onAppear() {
                self.viewModel.onAppear()
            }
            .onReceive(self.viewModel.$isLandscape) {
                print($0)
            }
    }
}

struct SwiftUIBindingView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIBindingView(viewModel: UIBindingViewModel())
    }
}
