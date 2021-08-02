//
//  SummaryView.swift
//  Blity
//
//  Created by Eduardo Dias on 2/08/21.
//

import SwiftUI

struct SummaryView: View {
    
    var expenses: [CategoryExpenses]
    
    var emptyState: EmptyState?
    
    @Binding
    var selectedTab: Int
    
    @Binding
    var isExpenseInProcess: Bool
    
    var body: some View {
        List {
            ForEach(expenses, id: \.self) { expenses in
                SummaryCategoryView(expenses: expenses)
            }.listRowBackground(Color.clear)
        }
        .onEmpty (emptyState, retryAction: {
            selectedTab = 1
            isExpenseInProcess = true
        })
        .offset(y: -25)
        .listStyle(SidebarListStyle())
        .tabItem {
            Image("DashboardIcon")
            Text("Summary")
        }
        .tag(0)
    }
}


struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(expenses: [], selectedTab: .constant(0), isExpenseInProcess: .constant(false))
    }
}
