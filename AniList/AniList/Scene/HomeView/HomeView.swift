//
//  HomeView.swift
//  AniList
//
//  Created by Luann Marques Luna on 22/04/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewViewModel
    
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
//        .searchable(text: $viewModel.search) {
//            ForEach(viewModel.searchResult, id: \.id) { anime in
//                HStack(spacing: 5) {
//                    URLImage(url: anime.url, width: 50, height: 50)
//                        .clipShape(Circle())
//                    Text(anime.title)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .foregroundColor(.primary)
//                }.searchCompletion(anime)
//            }
//        }
        .onChange(of: viewModel.search) {
            Task {
                await viewModel.findTerm()
            }
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewViewModel(service: APIService()))
}
