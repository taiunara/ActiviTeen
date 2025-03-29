//
//  RetangularCard.swift
//  ActivTeen
//
//  Created by user on 21/03/25.
//

import SwiftUI

struct CustomStyleRectangular: ViewModifier {
    let widthx = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height

    func body(content: Content) -> some View {

        content
            .frame(
                width: widthx * (360 / 393),
                height: height * (211 / 852))

    }
}

extension View {
    func cardRectangular() -> some View {
        modifier(CustomStyleRectangular())
    }
}

//Agrupar os componentes numa pasta
