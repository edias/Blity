//
//  CurrencyView.swift
//  Blity
//
//  Created by Eduardo Dias on 1/08/21.
//

import SwiftUI

struct CurrencyView: View {
    
    @Binding
    var isDisplayingCurrencySelection: Bool
    
    @Binding
    var selectedCurrency: Currency?
    
    var body: some View {
        
        NavigationView {
            List (Currency.allCases, id: \.self) { currency in
                Text(currency.displayName)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(ColorPalette.contrastColor)
                    .onTapGesture {
                    self.selectedCurrency = currency
                }.checkMark(when: selectedCurrency == currency)
            }.navigationBarTitle(Text("Choose Default Currency"), displayMode: .inline)
            
            .toolbar {
                Button("Close") {
                    isDisplayingCurrencySelection = false
                }
            }
        }
    }
}

struct CurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyView(isDisplayingCurrencySelection: .constant(false),
                     selectedCurrency: .constant(.NZ))
    }
}

private extension View {
    @ViewBuilder
    func checkMark(when condition: Bool) -> some View {
        modifier(CheckmarkModifier(checked: condition))
    }
}
