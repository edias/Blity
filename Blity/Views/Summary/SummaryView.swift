//
//  SummaryView.swift
//  Blity
//
//  Created by Eduardo Dias on 2/08/21.
//

import SwiftUI

struct SummaryView: View {
    
    var expenses: [CategoryExpenses]
    
    var totalExpense: String
    
    @Binding
    var isDisplayingCurrencySelection: Bool
    
    @Binding
    var isExpenseInProcess: Bool
    
    @Binding
    var selectedTab: Int
    
    var emptyState: EmptyState?
    
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
                    Text(totalExpense)
                        .font(.title)
                        .foregroundColor(ColorPalette.contrastColor)
                        .padding(.top, 80)
                    Text("spent this month")
                        .font(.subheadline)
                        .foregroundColor(ColorPalette.contrastColor)
                    Spacer()
                }
            }
            
            List {
                ForEach(expenses, id: \.self) { expenses in
                    SummaryCategoryView(expenses: expenses)
                }.listRowBackground(Color.clear)
            }
            .onEmpty (emptyState, action: {
                selectedTab = 1
                isExpenseInProcess = true
            })
            .offset(y: 170)
            .listStyle(SidebarListStyle())            
        }.edgesIgnoringSafeArea(.all)
    }
}


struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(expenses: [],
                    totalExpense: "20.00",
                    isDisplayingCurrencySelection: .constant(false),
                    isExpenseInProcess: .constant(false),
                    selectedTab: .constant(0),
                    emptyState: nil)
    }
}
