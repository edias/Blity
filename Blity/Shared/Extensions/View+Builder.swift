//
//  View+Builder.swift
//  Blity
//
//  Created by Eduardo Dias on 2/08/21.
//

import SwiftUI

extension View {
    
    @ViewBuilder
    func onEmpty(_ emptyState: EmptyState? = nil, action: @escaping () -> Void) -> some View {
        ZStack {
            if let emptyState = emptyState {
                EmptyStateView(emptyState, action: action)
            } else {
                self
            }
        }
    }
    
    @ViewBuilder
    func checkMark(when condition: Bool) -> some View {
        modifier(CheckmarkModifier(checked: condition))
    }
}
