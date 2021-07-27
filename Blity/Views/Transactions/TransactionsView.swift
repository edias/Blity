//
//  TransactionsView.swift
//  Blity
//
//  Created by Eduardo Dias on 27/07/21.
//

import SwiftUI

struct TransactionsView: View {
    
    init() {
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.backgroundColor = UIColor(ColorPalette.primaryColor)
        navigationBarAppearace.barTintColor = UIColor(ColorPalette.primaryColor)
        navigationBarAppearace.tintColor = UIColor(ColorPalette.contrastColor)
        navigationBarAppearace.titleTextAttributes = [.foregroundColor: UIColor(ColorPalette.contrastColor)]
    }
    
    var body: some View {
        NavigationView {
            
            Text ("Items")
                .navigationBarTitle(Text("Transactions"), displayMode: .inline)
                .toolbar {
                    Button(action: { print("Edit button was tapped") }) {
                        Image(systemName: "plus")
                    }
                }
        }
    }
}

struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsView()
    }
}
