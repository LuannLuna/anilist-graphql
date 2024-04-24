//
//  HomeViewFactory.swift
//  AniList
//
//  Created by Luann Marques Luna on 23/04/24.
//

import Foundation

enum HomeViewFactory {
    @MainActor static func make() -> HomeView {
        HomeView(
            viewModel: HomeViewViewModel(
                service: APIService()
            )
        )
    }
}
