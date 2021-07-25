//
//  SummaryCategoryBudgetView.swift
//  Blity
//
//  Created by Eduardo Dias on 25/07/21.
//

import SwiftUI

struct SummaryCategoryBudgetView: View {
    
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
                    .frame(width: geometry.size.width * CGFloat(totalSpent) / CGFloat(budget))
                
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
                        .frame(maxWidth: makePercentage(15, total: geometry.size.width), alignment: .center)
                        .foregroundColor(ColorPalette.primarySupportingContrastColor)
                    
                }
                
                HStack {
                    Spacer()
                    
                    Splitter(direction: .vertical, color: ColorPalette.primarySupportingContrastColor)
                    
                }
                .padding(.trailing, makePercentage(15, total: geometry.size.width))
                .padding(.vertical, 5)
            }.padding(.all, 2)
        }
    }
    
    private func makePercentage(_ percentage: CGFloat, total: CGFloat) -> CGFloat {
        total * percentage / 100
    }
}

struct BudgetDisplayer_Previews: PreviewProvider {
    static var previews: some View {
        SummaryCategoryBudgetView(budget: 300, totalSpent: 110)
            .previewLayout(.fixed(width:420, height: 50))
    }
}
 
