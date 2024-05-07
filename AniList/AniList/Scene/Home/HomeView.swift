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
            NavigationLink(destination:
                            DetailFactory.make(id: selectedID),
               isActive: self.$pushActive) {
                 EmptyView()
            }.hidden()
            ForEach(viewModel.searchResult, id: \.id) { result in
                SearchRow(id: result.animeID, title: result.title, url: result.url)
                    .onAppear {
                        viewModel.findMoreItemsIfNeed(result)
                    }
                    .onTapGesture {
                        self.selectedID = result.animeID
                        self.pushActive = true
                    }
            }
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewViewModel(service: HomeService()))
}
