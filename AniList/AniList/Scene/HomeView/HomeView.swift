//
//  HomeView.swift
//  AniList
//
//  Created by Luann Marques Luna on 22/04/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewViewModel
    @Environment(\.isSearching) var isSearching
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List(viewModel.animes, id: \.id) { anime in
                        AnimeListRow(media: anime)
                            .onAppear {
                                viewModel.loadMoreItemsIfNeed(anime)
                            }
                    }
                    .listStyle(PlainListStyle())
                }
                
                if viewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .onAppear {
                Task {
                    await viewModel.fetchAllAnimes()
                }
            }
            .navigationTitle("Anime List")
        }
        .searchable(text: $viewModel.search, placement: .sidebar) {
            ForEach(viewModel.searchResult, id: \.id) { anime in
                HStack(spacing: 5) {
                    URLImage(url: anime.url, width: 50, height: 50)
                    Text(anime.title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.primary)
                }
                .onAppear {
                    viewModel.findMoreItemsIfNeed(anime)
                }
            }
        }
        .onChange(of: isSearching) { oldValue, newValue in
            print("Searching: \(newValue)")
            if !newValue {
                viewModel.search = ""
            }
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewViewModel(service: APIService()))
}
