//
//  SummaryCategoryView.swift
//  Blity
//
//  Created by Eduardo Dias on 25/07/21.
//

import SwiftUI

struct SummaryCategoryView: View {
    
    private let viewModel: SummaryCategoryViewModel
    
    init(expenses: CategoryExpenses) {
        viewModel = SummaryCategoryViewModel(expenses: expenses)
    }
    
    var body: some View {
        
        VStack {
            
            HStack {
                Image(viewModel.categoryIcon)
                    .resizable()
                    .frame(width: 25, height: 25)
                Text(viewModel.categoryName)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Spacer()
            }
            
            SummaryCategoryBudgetView(budget: viewModel.budget, totalSpent: viewModel.totalSpent)
                .frame(height: 42)
            
            Splitter(direction: .horizontal, color: ColorPalette.secondarySupportingColor)
                .padding(.vertical, 10)
            
            HStack {
                Image(viewModel.tracking.icon)
                    .resizable()
                    .frame(width: 20, height: 20)
                Text(viewModel.tracking.message)
                    .foregroundColor(ColorPalette.secondarySupportingContrastColor)
                    .font(.footnote)
                Spacer()
            }
            
        }
        .cornerRadius(10)
        .padding()
    }
}

struct SummaryCategoryView_Previews: PreviewProvider {
    
    static var expenses: CategoryExpenses {
        let categoryBudget = CategoryBudget(category: .food, budget: 500)
        return CategoryExpenses(categoryBudget: categoryBudget, totalSpent: 200)
    }
    
    static var previews: some View {
        SummaryCategoryView(expenses: expenses)
            .previewLayout(.fixed(width: 400, height: 160))
    }
}
