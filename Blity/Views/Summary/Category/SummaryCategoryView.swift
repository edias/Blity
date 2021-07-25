//
//  SummaryCategoryView.swift
//  Blity
//
//  Created by Eduardo Dias on 25/07/21.
//

import SwiftUI

struct SummaryCategoryView: View {
    
    var expenses: CategoryExpenses
    
    var body: some View {
        
        VStack {
            
            HStack {
                Image(expenses.categoryIcon)
                    .resizable()
                    .frame(width: 25, height: 25)
                Text(expenses.categoryName)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Spacer()
            }
            
            SummaryCategoryBudgetView(budget: expenses.categoryBudget, totalSpent: expenses.totalSpent)
                .frame(height: 42)
            
            Splitter(direction: .horizontal, color: ColorPalette.secondarySupportingColor)
            
        }.padding()
    }
}

struct SummaryCategoryView_Previews: PreviewProvider {
    
    static var expenses: CategoryExpenses {
        let category = Category(name: "Food", icon: "FoodIcon", budget: 500)
        return CategoryExpenses(category: category, totalSpent: 175)
    }
    
    static var previews: some View {
        SummaryCategoryView(expenses: expenses)
            .previewLayout(.fixed(width: 400, height: 100))
    }
}
