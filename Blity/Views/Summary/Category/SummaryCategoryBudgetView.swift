//
//  SummaryCategoryBudgetView.swift
//  Blity
//
//  Created by Eduardo Dias on 25/07/21.
//

import SwiftUI

struct SummaryCategoryBudgetView: View {
    
    private let padding = CGFloat(2)
    
    var budget: Int
    var totalSpent: Int
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack (alignment: .leading) {
                
                Rectangle()
                    .fill(ColorPalette.primarySupportingColor)
                    .cornerRadius(100)
                
                Rectangle()
                    .fill(ColorPalette.primaryColor)
                    .cornerRadius(100)
                    .frame(width: fillWidth(width: geometry.size.width - padding,
                                            totalSpent: totalSpent,
                                            budget: budget))
                
                HStack {
                    Text("$\(totalSpent)")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(ColorPalette.contrastColor)
                        .padding(.leading, 15)
                    
                    Spacer()
                    
                    Text("$\(budget)")
                        .font(.footnote)
                        .fontWeight(.regular)
                        .frame(maxWidth: makePercentage(18, total: geometry.size.width), alignment: .center)
                        .foregroundColor(ColorPalette.primarySupportingContrastColor)
                    
                }
                
                HStack {
                    Spacer()
                    
                    Splitter(direction: .vertical, color: ColorPalette.primarySupportingContrastColor)
                    
                }
                .padding(.trailing, makePercentage(18, total: geometry.size.width))
                .padding(.vertical, 5)
            }.padding(.all, padding)
        }
    }
    
    private func fillWidth(width: CGFloat, totalSpent: Int, budget: Int) -> CGFloat {
        min(width, width * CGFloat(totalSpent) / CGFloat(budget))
    }
    
    private func makePercentage(_ percentage: CGFloat, total: CGFloat) -> CGFloat {
        total * percentage / 100
    }
}

struct BudgetDisplayer_Previews: PreviewProvider {
    static var previews: some View {
        SummaryCategoryBudgetView(budget: 1300, totalSpent: 270)
            .previewLayout(.fixed(width:420, height: 50))
    }
}
 
