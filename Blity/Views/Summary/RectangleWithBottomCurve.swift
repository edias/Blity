//
//  BottomCurveShape.swift
//  Blity
//
//  Created by Eduardo Dias on 25/07/21.
//

import SwiftUI

struct RectangleWithBottomCurve: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.maxY),
                          control: CGPoint(x: rect.midX, y: rect.maxY + 40))
        path.closeSubpath()
        
        return path
    }
}


struct BottomCurvedRectangle_Previews: PreviewProvider {
    static var previews: some View {
        RectangleWithBottomCurve()
            .frame(height: 300)
            .previewLayout(.fixed(width: 400, height: 500))
    }
}
