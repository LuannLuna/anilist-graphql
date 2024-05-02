//
//  AniListApp.swift
//  AniList
//
//  Created by Luann Marques Luna on 22/04/24.
//

import SwiftUI

@main
struct AniListApp: App {
    var body: some Scene {
        WindowGroup {
            HomeFactory.make()
        }
    }
}
