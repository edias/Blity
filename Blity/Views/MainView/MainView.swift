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
    private var tabHeight = CGFloat(0)
    
    @State
    private var tabOffSet = CGFloat(0)
    
    @State
    private var isDisplayingCurrencySelection = false
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        
        ZStack {
            
            Group {
                VStack {
                    MainHeaderBackgroundView(colors: [ColorPalette.secondaryColor, ColorPalette.primaryColor])
                        .frame(height: 150)
                    Spacer()
                }
                
                VStack {
                    SettingsIconView(isDisplayingSettings: $isDisplayingCurrencySelection)
                    Spacer()
                }
                
                VStack {
                    Text(viewModel.totalExpenses.formattedValueWithCurrency)
                        .font(.title)
                        .foregroundColor(ColorPalette.contrastColor)
                        .padding(.top, 80)
                    Text("spent this month")
                        .font(.subheadline)
                        .foregroundColor(ColorPalette.contrastColor)
                    Spacer()
                }
            }
            
            GeometryReader { geometry in

                TabView (selection: $selectedTab) {

                    SummaryView(expenses: viewModel.categoryExpenses,
                                emptyState: viewModel.emptyState,
                                selectedTab: $selectedTab,
                                isExpenseInProcess: $isExpenseInProcess)
                    .tag(0)
                    .onAppear(perform: {
                        resizeHeight(tabOffSet: 170, totalHeight: geometry.size.height)
                        viewModel.loadCategoryExpenses()
                    })

                    ExpensesView(isExpenseInProcess: $isExpenseInProcess)
                        .tabItem {
                            Image("MoneyIcon")
                            Text("Expenses")
                        }
                        .tag(1)
                        .onAppear(perform: {
                            resizeHeight(totalHeight: geometry.size.height)
                        })
                }
                .offset(y: tabOffSet)
                .frame(height: tabHeight)
            }
        }
        .sheet(isPresented: $isDisplayingCurrencySelection, onDismiss: { viewModel.loadCategoryExpenses() }) {
            CurrencyView(isDisplayingCurrencySelection: $isDisplayingCurrencySelection)
        }.edgesIgnoringSafeArea(.all)
    }
    
    private func resizeHeight(tabOffSet: CGFloat = 0, totalHeight: CGFloat) {
        self.tabOffSet = tabOffSet
        self.tabHeight = totalHeight - tabOffSet
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewLayout(.fixed(width: 400, height: 800))
    }
}
