//
//  ExpenseView.swift
//  Blity
//
//  Created by Eduardo Dias on 31/07/21.
//

import SwiftUI

struct ExpenseView: View {
    
    var expense: Expense
    
    var body: some View {
        HStack {
            Text(expense.description)
                .font(.subheadline)
            Spacer()
            Text(expense.amount.formattedValue)
                .font(.footnote)
            Splitter(direction: .vertical)
                .padding(.vertical, 5)
            Image(expense.amount.currency.iconName)
                .resizable()
                .frame(width: 25, height: 25)
        }
    }
}

struct ExpenseView_Previews: PreviewProvider {
    
    static var expense = Expense(description: "McDonalds",
                                 category: .food,
                                 amount: Amount("20.00"),
                                 date: Date())
    
    static var previews: some View {
        ExpenseView(expense: expense)
    }
}
