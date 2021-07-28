//
//  ExpensesView.swift
//  Blity
//
//  Created by Eduardo Dias on 27/07/21.
//

import SwiftUI

struct ExpensesView: View {
    
    @ObservedObject
    private var viewModel = ExpensesViewModel()
    
    @State
    private var isExpenseInProcess = false
    
    init() {
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.backgroundColor = UIColor(ColorPalette.primaryColor)
        navigationBarAppearace.barTintColor = UIColor(ColorPalette.primaryColor)
        navigationBarAppearace.tintColor = UIColor(ColorPalette.contrastColor)
        navigationBarAppearace.titleTextAttributes = [.foregroundColor: UIColor(ColorPalette.contrastColor)]
    }
    
    var body: some View {
        
        NavigationView {
            
            List {
                ForEach(viewModel.categories, id: \.self) { category in
                    let header = ExpenseCategoryHeaderView(category: category)
                    Section(header: header) {
                        ForEach(viewModel.expensesForCategory(category), id: \.self) { expense in
                            HStack {
                                Text(expense.description)
                            }
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle(Text("Expenses"), displayMode: .inline)
            .toolbar {
                Button(action: { isExpenseInProcess = true }) {
                    Image(systemName: "plus")
                }
            }
        }.sheet(isPresented: $isExpenseInProcess) {
            ExpenseEntryView(isExpenseInProcess: $isExpenseInProcess, completionHandler: { expense in
                viewModel.addExpense(expense)
            })
        }
    }
}

struct ExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesView()
    }
}
