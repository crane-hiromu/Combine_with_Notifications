//
//  SwiftUIBindingView.swift
//  Combine_with_Notifications
//
//  Created by Hiromu Tsuruta on 2019/12/06.
//  Copyright © 2019 Hiromu Tsuruta. All rights reserved.
//

import SwiftUI

// MARK: - UIView

struct SwiftUIBindingView: View {
    
    // MARK: Properties
    
    private var viewModel = UIBindingViewModel()
    
    
    // MARK: View

    var body: some View {
        EmptyView()
            .onAppear() {
                print(self.viewModel.$isLandscape)
            }
    }
}

struct SwiftUIBindingView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIBindingView()
    }
}
