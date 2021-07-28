//
//  ExpenseEntryView.swift
//  Blity
//
//  Created by Eduardo Dias on 27/07/21.
//

import SwiftUI

struct ExpenseEntryView: View {
    
    @Binding
    var isExpenseInProcess: Bool
    
    var completionHandler: (Expense) -> Void
    
    @ObservedObject
    private var viewModel = ExpenseEntryViewModel()
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                TextField("Description", text: $viewModel.description)
                
                Picker(selection: $viewModel.categorySelection, label: Text("Category")) {
                    ForEach(viewModel.categories, id: \.self) {
                        Text($0.capitalFormatting)
                    }
                }
                
                HStack (spacing: 2) {
                    Text("$")
                    TextField("Price", text: $viewModel.price)
                        .keyboardType(.numberPad)
                    Spacer()
                    Picker(selection: $viewModel.currencySelection, label: Text("")) {
                        ForEach(viewModel.currencies, id: \.self) {
                            Text($0.displayName)
                        }
                    }.frame(width: 70)
                }
                
                HStack {
                    DatePicker("", selection: $viewModel.dateSelection, displayedComponents: .date)
                        .datePickerStyle(CompactDatePickerStyle()).labelsHidden()
                    Spacer()
                }
                
                                
            }.navigationBarTitle(Text("Add Expense"), displayMode: .inline)
            
            .toolbar {
                Button("Save") {
                    if let expense = viewModel.expense {
                        completionHandler(expense)
                    }
                    isExpenseInProcess = false
                }
                .foregroundColor(ColorPalette.contrastColor)
                .disabled(!viewModel.isExpenseValid)
            }
        }
    }
}

struct ExpenseEntryView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseEntryView(isExpenseInProcess: .constant(true), completionHandler: { _ in })
            .previewLayout(.fixed(width: 400, height: 350))
        
    }
}
