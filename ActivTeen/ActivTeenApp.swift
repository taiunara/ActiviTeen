//
//  ActivTeenApp.swift
//  ActivTeen
//
//  Created by user on 18/03/25.
//

import SwiftUI
import SwiftData
@main
struct ActivTeenApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                homePage()
            }
            .modelContainer(for: [Activity.self, Challenge.self, ActivityBook.self], inMemory: false)
//            homePage()
//                .modelContainer(for: Song.self, inMemory: false)
        }
    }
}
