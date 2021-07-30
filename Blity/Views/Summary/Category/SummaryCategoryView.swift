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
        
        ZStack {
            
            Rectangle()
                .fill(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.2), radius: 5)
            
            VStack (spacing: 15) {
                
                HStack {
                    Image(viewModel.categoryIcon)
                        .resizable()
                        .frame(width: 25, height: 25)
                    Text(viewModel.categoryName)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Spacer()
                }
                .padding(.horizontal, 15)
                .padding(.top, 15)
                
                SummaryCategoryBudgetView(budget: viewModel.budget, totalSpent: viewModel.totalSpent)
                    .frame(height: 42)
                    .padding(.horizontal, 12)
                
                Splitter(direction: .horizontal, color: ColorPalette.secondarySupportingColor)
                    .padding(.horizontal, 15)
                
                HStack {
                    Image(viewModel.tracking.icon)
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text(viewModel.tracking.message)
                        .foregroundColor(ColorPalette.secondarySupportingContrastColor)
                        .font(.footnote)
                    Spacer()
                }
                .padding(.horizontal, 15)
                .padding(.bottom, 15)
            }
        }
    }
}

struct SummaryCategoryView_Previews: PreviewProvider {
    
    static var expenses: CategoryExpenses {
        let categoryBudget = CategoryBudget(category: .food, budget: 500)
        return CategoryExpenses(categoryBudget: categoryBudget, totalSpent: 200)
    }
    
    static var previews: some View {
        SummaryCategoryView(expenses: expenses)
            .previewLayout(.fixed(width: 400, height: 200))
    }
}
