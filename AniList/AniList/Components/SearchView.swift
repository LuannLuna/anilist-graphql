//
//  SearchView.swift
//  AniList
//
//  Created by Luann Marques Luna on 07/05/24.
//

import SwiftUI

struct SearchView: View {
    var results: [SearchResultModel]
    
    @State var pushActive = false
    @State var selectedID: Int = 0
    
    var body: some View {
        NavigationLink(destination:
                        DetailFactory.make(id: selectedID),
           isActive: self.$pushActive) {
             EmptyView()
        }.hidden()
        ForEach(results, id: \.id) { result in
            SearchRow(id: result.id, title: result.title, url: result.image)
                .onTapGesture {
                    self.selectedID = result.id
                    self.pushActive = true
                }
        }
    }
}

struct SearchResultModel {
    let id: Int
    let image: URL?
    let title: String
}

#Preview {
    SearchView(
        results: [SearchResultModel(
            id: 1,
            image: URL(string: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx1-CXtrrkMpJ8Zq.png"),
            title: "Cowboy Bebop"
        )]
    )
}
