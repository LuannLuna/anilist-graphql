//
//  HorizontalGrid.swift
//  AniList
//
//  Created by Luann Marques Luna on 26/04/24.
//

import SwiftUI

struct HorizontalGrid: View {
    struct HGridItem {
        let id: Int
        let url: URL?
        let title: String
    }
    
    let columns = [GridItem(.adaptive(minimum: 100))]
    let items: [HGridItem]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: columns, alignment: .top, spacing: 10) {
                ForEach(items, id: \.title) { item in
                    NavigationLink {
                        DetailFactory.make(id: item.id)
                    } label: {
                        VStack(alignment: .center) {
                            URLImage(url: item.url, width: 80, height: 100)
                                .scaledToFill()
                                .frame(height: 100)
                            Text(item.title)
                                .frame(width: 80)
                                .padding(5)
                                .font(.caption2)
                        }
                    }
                }
            }
        }
        .frame(minHeight: 150)
    }
}

#Preview {
    HorizontalGrid(
        items: [HorizontalGrid.HGridItem(
            id: 1,
            url: URL(string: "https://s4.anilist.co/file/anilistcdn/character/large/b11-TA5Nuk7EDUZG.jpg"),
            title: "Edward Elric"
        )]
    )
}
