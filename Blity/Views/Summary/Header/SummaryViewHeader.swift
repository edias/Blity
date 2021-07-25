//
//  SummaryViewHeader.swift
//  Blity
//
//  Created by Eduardo Dias on 25/07/21.
//

import SwiftUI

struct SummaryViewHeader: View {
    
    let colors: [Color]
    
    var body: some View {
        RectangleWithBottomCurve()
            .fill(
                LinearGradient(gradient:
                                Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
            )
    }
}

struct SummaryViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        SummaryViewHeader(colors: [ColorPalette.primaryColor, ColorPalette.secondaryColor])
            .previewLayout(.fixed(width: 400, height: 400))
    }
}
