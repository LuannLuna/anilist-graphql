//
//  HomeView.swift
//  AniList
//
//  Created by Luann Marques Luna on 22/04/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewViewModel
    @State var pushActive = false
    @State var selectedID: Int = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List(viewModel.animes, id: \.id) { anime in
                        NavigationLink {
                            DetailFactory.make(id: anime.animeID)
                        } label: {
                            AnimeListRow(media: anime)
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
                NavigationLink(destination:
                                DetailFactory.make(id: selectedID),
                   isActive: self.$pushActive) {
                     EmptyView()
                }.hidden()
            }
            .task(priority: .background, {
                await viewModel.fetchAllAnimes()
            })
            .navigationTitle("Anime List")
        }
        .searchable(text: $viewModel.search) {
            ForEach(viewModel.searchResult, id: \.id) { anime in
                SearchRow(id: anime.animeID, title: anime.title)
                    .onTapGesture {
                        selectedID = anime.animeID
                        pushActive = true
                    }
            }
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewViewModel(service: HomeService()))
}
