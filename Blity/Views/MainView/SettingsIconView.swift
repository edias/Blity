//
//  SettingsIconView.swift
//  Blity
//
//  Created by Eduardo Dias on 1/08/21.
//

import SwiftUI

struct SettingsIconView: View {
    
    @Binding
    var isDisplayingSettings: Bool
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                isDisplayingSettings = true
            }) {
                Image("SettingsIcon")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(ColorPalette.contrastColor)
            }
        }
        .padding(.top, 45)
        .padding(.trailing, 15)
    }
}

struct SettingsIconView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsIconView(isDisplayingSettings: .constant(true))
    }
}
