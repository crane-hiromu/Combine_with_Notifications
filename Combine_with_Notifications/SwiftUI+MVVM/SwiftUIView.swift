//
//  SwiftUIView.swift
//  Combine_with_Notifications
//
//  Created by admin on 2019/12/03.
//  Copyright © 2019 Hiromu Tsuruta. All rights reserved.
//

import SwiftUI

struct SwiftUIView: View {
        
    private var viewModel: UIViewModelType = UIViewModel()
    
    var body: some View {
        EmptyView()
            .onAppear() {
                /// input
                let orientationCancellable = NotificationCenter
                    .Publisher(center: .default, name: UIDevice.orientationDidChangeNotification, object: nil)
                    .sink { notification in
                        self.viewModel.inputs.didChangeOrientation(notification: notification)
                    }
                
                self.viewModel.inputs.willStore(cancellable: orientationCancellable)
                
                /// output
                let isLandscapeCancellable = self.viewModel.outputs.isLandscape
                    .sink { isLandscape in
                        print("isLandscape: \(isLandscape)")
                    }
                
                self.viewModel.inputs.willStore(cancellable: isLandscapeCancellable)
            }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
