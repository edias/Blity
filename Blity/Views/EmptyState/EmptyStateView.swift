//
//  EmptyStateView.swift
//  Blity
//
//  Created by Eduardo Dias on 2/08/21.
//

import SwiftUI

enum EmptyState {
    case summary
    case expenses
}

private struct EmptyStateDataModel {
    let icon: String
    let title: String
    let message: String
}

struct EmptyStateView: View {
    
    private var action: () -> Void
    
    @State
    private var dataModel: EmptyStateDataModel
    
    init(_ emptyState: EmptyState, action: @escaping () -> Void) {
        switch emptyState {
            case .summary:
                dataModel = EmptyStateDataModel(icon: "EmptyStateSummaryIcon",
                                                title: "No summary",
                                                message: "Start adding your expenses.")
            case .expenses:
                dataModel = EmptyStateDataModel(icon: "EmptyStateMoneyIcon",
                                                title: "No expenses",
                                                message: "Start adding your expenses.")
        }
        self.action = action
    }
    
    var body: some View {
        
        VStack {
            Image(dataModel.icon)
                .resizable()
                .scaledToFit()
                .foregroundColor(ColorPalette.primaryColor)
                .frame(width: 80, height: 80)
                .padding(.bottom, 20)
                .padding(.top, 180)
                .shadow(color: Color.black.opacity(0.3), radius: 3)
            
            Text(dataModel.title)
                .font(.title2)
                .bold()
                .foregroundColor(ColorPalette.secondarySupportingContrastColor)
            
            Text(dataModel.message)
                .font(.body)
                .foregroundColor(ColorPalette.secondarySupportingContrastColor)
                .multilineTextAlignment(.center)
                .padding(.top, 2)
                .padding(.bottom, 120)
            
            Button("Add expenses") {
                action()
            }
            .foregroundColor(ColorPalette.contrastColor)
            .padding(.vertical, 12)
            .padding(.horizontal, 30)
            .font(.subheadline.weight(.bold))
            .background(ColorPalette.primaryColor)
            .cornerRadius(35)
            
            Spacer(minLength: 100)
        }
        
        .frame(width: 350, alignment: .center)
    }
}
struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView(.summary, action: {})
    }
}
