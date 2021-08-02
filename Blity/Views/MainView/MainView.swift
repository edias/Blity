//
//  MainView.swift
//  Blity
//
//  Created by Eduardo Dias on 25/07/21.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject
    private var viewModel = MainViewModel()
    
    @State
    private var isExpenseInProcess = false
    
    @State
    private var selectedTab = 0
    
    @State
    private var isDisplayingCurrencySelection = false
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        
        TabView (selection: $selectedTab) {

            SummaryView(expenses: viewModel.categoryExpenses,
                        totalExpense: viewModel.totalExpenses.formattedValueWithCurrency,
                        isDisplayingCurrencySelection: $isDisplayingCurrencySelection,
                        isExpenseInProcess: $isExpenseInProcess,
                        selectedTab: $selectedTab,
                        emptyState: viewModel.emptyState)
            .tabItem {
                Image("DashboardIcon")
                Text("Summary")
            }
            .tag(0)
            .onAppear(perform: { viewModel.loadCategoryExpenses() })

            ExpensesView(isExpenseInProcess: $isExpenseInProcess)
            .tabItem {
                Image("MoneyIcon")
                Text("Expenses")
            }
            .tag(1)
        }
        .sheet(isPresented: $isDisplayingCurrencySelection, onDismiss: { viewModel.loadCategoryExpenses() }) {
            CurrencyView(isDisplayingCurrencySelection: $isDisplayingCurrencySelection)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewLayout(.fixed(width: 400, height: 800))
    }
}
