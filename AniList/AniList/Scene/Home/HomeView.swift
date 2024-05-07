//
//  HomeView.swift
//  AniList
//
//  Created by Luann Marques Luna on 22/04/24.
//

import SwiftUI
import DSKit

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List(viewModel.animes, id: \.id) { anime in
                        NavigationLink {
                            DetailFactory.make(id: anime.animeID)
                        } label: {
                            ListItemRow(item: anime.asListItemModel)
                                .onAppear {
                                    viewModel.loadMoreItemsIfNeed(anime)
                                }
                        }
                    }
                    .listStyle(PlainListStyle())
                }
                
                if viewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .task(priority: .background, {
                await viewModel.fetchAllAnimes()
            })
            .navigationTitle("Anime List")
        }
        .searchable(text: $viewModel.search) {
            SearchView(results: viewModel.searchResult.map {
                SearchResultModel(id: $0.animeID, image: $0.url, title: $0.title)
            })
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewViewModel(service: HomeService()))
}
