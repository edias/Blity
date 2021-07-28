//
//  ExpenseCategoryHeaderView.swift
//  Blity
//
//  Created by Eduardo Dias on 28/07/21.
//

import SwiftUI

struct ExpenseCategoryHeaderView: View {
    
    var category: Category
    
    var body: some View {
        HStack {
            Image(category.iconName)
                .resizable()
                .frame(width: 25, height: 25)
            Text(category.categoryName)
                .font(.subheadline)
        }
    }
}

struct ExpenseCategoryHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseCategoryHeaderView(category: .food)
    }
}
