//
//  ChallengersCardModifier.swift
//  ActivTeen
//
//  Created by user on 24/03/25.
//

import SwiftUI

struct CustomStyleChallenger: ViewModifier {
    let widthx = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height

    func body(content: Content) -> some View {

        content
            .frame(
                width: widthx * (361 / 393),
                height: height * (82 / 852))

    }
}

extension View {
    func challengerCard() -> some View {
        modifier(CustomStyleChallenger())
    }
}
