//
//  _SwiftUIBindingView.swift
//  Combine_with_Notifications
//
//  Created by Hiromu Tsuruta on 2019/12/06.
//  Copyright © 2019 Hiromu Tsuruta. All rights reserved.
//

/*
Not working @Published on Protocol
*/

import SwiftUI

struct _SwiftUIBindingView: View {

    // MARK: Properties
    
    var viewModel: _UIBindingViewModelType
    
    
    // MARK: View

    var body: some View {
        EmptyView()
            .onAppear() {
                self.viewModel.iuputs.onAppear()
            }
            // .onReceive(self.viewModel.outputs.isLandscape) {
            //    print($0)
            //}
    }
}

struct _SwiftUIBindingView_Previews: PreviewProvider {
    static var previews: some View {
        _SwiftUIBindingView(viewModel: _UIBindingViewModel())
    }
}
