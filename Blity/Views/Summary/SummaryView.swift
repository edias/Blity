//
//  SummaryView.swift
//  Blity
//
//  Created by Eduardo Dias on 25/07/21.
//

import SwiftUI

struct SummaryView: View {
    
    @ObservedObject
    private var viewModel = SummaryViewModel()
    
    @State
    private var tabHeight = CGFloat(0)
    
    @State
    private var offSet = CGFloat(0)
    
    @State
    private var isDisplayingCurrencySelection = false
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        
        ZStack {
            
            VStack {
                SummaryViewHeader(colors: [ColorPalette.secondaryColor, ColorPalette.primaryColor])
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
            
            GeometryReader { geometry in

                TabView {

                    List {
                        ForEach(viewModel.categoryExpenses, id: \.self) { expenses in
                            SummaryCategoryView(expenses: expenses)
                        }.listRowBackground(Color.clear)
                    }
                    .offset(y: -25)
                    .listStyle(SidebarListStyle())
                    .tabItem {
                        Image("DashboardIcon")
                        Text("Summary")
                    }
                    .onAppear(perform: {
                        resizeHeight(offSet: 170, totalHeight: geometry.size.height)
                        viewModel.loadCategoryExpenses()
                    })

                    ExpensesView()
                        .tabItem {
                            Image("MoneyIcon")
                            Text("Expenses")
                        }
                        .onAppear(perform: {
                            resizeHeight(totalHeight: geometry.size.height)
                        })
                }
                .offset(y: offSet)
                .frame(height: tabHeight)
            }
            
        }
        .sheet(isPresented: $isDisplayingCurrencySelection, onDismiss: { viewModel.loadCategoryExpenses() }) {
            CurrencyView(isDisplayingCurrencySelection: $isDisplayingCurrencySelection)
        }.edgesIgnoringSafeArea(.all)
    }
    
    private func resizeHeight(offSet: CGFloat = 0, totalHeight: CGFloat) {
        self.offSet = offSet
        self.tabHeight = totalHeight - offSet
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
            .previewLayout(.fixed(width: 400, height: 800))
    }
}
