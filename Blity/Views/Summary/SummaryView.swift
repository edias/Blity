//
//  ContentView.swift
//  Blity
//
//  Created by Eduardo Dias on 25/07/21.
//

import SwiftUI

struct SummaryView: View {
    var body: some View {
        VStack {
            SummaryViewHeader(colors: [ColorPalette.secondaryColor, ColorPalette.primaryColor])
                .frame(height: 150)
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
            .previewLayout(.fixed(width: 400, height: 600))
    }
}
