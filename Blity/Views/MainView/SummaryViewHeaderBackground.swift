//
//  MainHeaderBackgroundView.swift
//  Blity
//
//  Created by Eduardo Dias on 25/07/21.
//

import SwiftUI

struct MainHeaderBackgroundView: View {
    
    let colors: [Color]
    
    var body: some View {
        RectangleWithBottomCurve()
            .fill(
                LinearGradient(gradient:
                                Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
            )
    }
}

struct SummaryViewHeaderBackground_Previews: PreviewProvider {
    static var previews: some View {
        MainHeaderBackgroundView(colors: [ColorPalette.primaryColor, ColorPalette.secondaryColor])
            .previewLayout(.fixed(width: 400, height: 400))
    }
}
