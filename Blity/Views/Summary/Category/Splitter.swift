//
//  Splitter.swift
//  Blity
//
//  Created by Eduardo Dias on 25/07/21.
//

import SwiftUI

struct Splitter: View {
    
    enum Direction {
        case vertical, horizontal
    }
    
    var direction: Direction
    
    var color: Color
    
    var body: some View {
        Rectangle()
            .foregroundColor(color)
            .split(withDirection: direction)
    }
}

struct Splitter_Previews: PreviewProvider {
    static var previews: some View {
        Splitter(direction: .horizontal, color: ColorPalette.secondarySupportingColor)
    }
}

private extension View {
    func split(withDirection direction: Splitter.Direction) -> some View {
        self.modifier(SplitterLine(direction: direction))
    }
}

fileprivate struct SplitterLine: ViewModifier {
    
    var direction: Splitter.Direction

    func body(content: Content) -> some View {
        direction == .vertical ? content.frame(width: 1) : content.frame(height: 1)
    }
}
