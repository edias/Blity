//
//  CheckmarkModifier.swift
//  Blity
//
//  Created by Eduardo Dias on 1/08/21.
//

import SwiftUI

struct CheckmarkModifier: ViewModifier {
    
    var checked = false
    
    func body(content: Content) -> some View {
        Group {
            if checked {
                HStack {
                    content
                    Spacer()
                    Image("CheckmarkIcon")
                        .resizable()
                        .foregroundColor(ColorPalette.primaryColor)
                        .frame(width: 20, height: 20)
                }
            } else {
                content
            }
        }
    }
}
