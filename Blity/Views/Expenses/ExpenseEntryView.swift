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
    
    @ObservedObject
    private var viewModel = ExpenseEntryViewModel()
    
    var body: some View {
        
        NavigationView {
            
            Form {
                Picker(selection: $viewModel.categorySelection, label: Text("Category")) {
                    ForEach(viewModel.categories, id: \.self) {
                        Text($0.displayName)
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
                Button("Save") { isExpenseInProcess = false }
                    .foregroundColor(ColorPalette.contrastColor)
                    .disabled(!viewModel.isExpenseValid)
            }
        }
    }
}

struct ExpenseEntryView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseEntryView(isExpenseInProcess: .constant(true))
            .previewLayout(.fixed(width: 400, height: 350))
        
    }
}
