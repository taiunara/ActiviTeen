//
//  RetangularCard.swift
//  ActivTeen
//
//  Created by user on 21/03/25.
//

import SwiftUI

struct CustomStyleHeader: ViewModifier {
    let widthx = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height

    func body(content: Content) -> some View {

        content
            .frame(
                width: widthx * (394 / 393),
                height: height * (196 / 852))

    }
}

extension View {
    func cardHeader() -> some View {
        modifier(CustomStyleHeader())
    }
}
