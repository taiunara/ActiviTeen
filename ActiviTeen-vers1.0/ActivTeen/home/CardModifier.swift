//
//  CardModifier.swift
//  ActivTeen
//
//  Created by user on 21/03/25.
//

import SwiftUI

struct CustomStyleSquare: ViewModifier {
    let widthx = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height

    func body(content: Content) -> some View {

        content
            .frame(
                width: widthx * (172 / 393),
                height: height * (181 / 852))

    }
}

extension View {
    func cardSquare() -> some View {
        modifier(CustomStyleSquare())
    }
}
//Agrupar componentes numa pasta
