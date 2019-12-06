//
//  _SwiftUIBindingView.swift
//  Combine_with_Notifications
//
//  Created by Hiromu Tsuruta on 2019/12/06.
//  Copyright © 2019 Hiromu Tsuruta. All rights reserved.
//

import SwiftUI

struct _SwiftUIBindingView: View {

    // MARK: Properties
    
    let viewModel: _UIBindingViewModelType
    
    
    // MARK: View

    var body: some View {
        EmptyView()
            .onAppear() {
                print(self.viewModel.outputs.isLandscape)
            }
    }
}

struct _SwiftUIBindingView_Previews: PreviewProvider {
    static var previews: some View {
        _SwiftUIBindingView(viewModel: _UIBindingViewModel())
    }
}
