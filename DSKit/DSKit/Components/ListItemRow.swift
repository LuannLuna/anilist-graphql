//
//  ListItemRow.swift
//  DSKit
//
//  Created by Luann Marques Luna on 07/05/24.
//

import SwiftUI

public
struct ListItemRow: View {
    var item: ListItemModel
    
    public init(item: ListItemModel) {
        self.item = item
    }
    
    public var body: some View {
        HStack(alignment: .top) {
            VStack {
                CacheImage(url: item.url)
                    .frame(width: 100, height: 150)
                Spacer()
            }
            VStack(alignment: .leading, spacing: 10) {
                Text(item.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                Text(item.subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: "face.smiling")
                        .foregroundColor(.green)
                    
                    VStack(alignment: .leading) {
                        
                        if let percent = item.approvePercentage {
                            Text(percent)
                                .font(.callout)
                        }
                        if let popularity = item.users {
                            Text(popularity)
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text(item.type)
                        if let episodios = item.episodes {
                            Text(episodios)
                        }
                    }
                    Spacer()
                }
                .font(.footnote)
                .foregroundColor(.gray)
                .fontWeight(.semibold)
                GenresGrid(genres: item.genres, color: item.hexColor)
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    ListItemRow(
        item: ListItemModel(
            url: URL(string: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx1-CXtrrkMpJ8Zq.png"),
            title: "Cowboy Bebop",
            subtitle: "カウボーイビバップ",
            approvePercentage: "86%",
            users: "345926 users",
            type: "TV",
            episodes: "26 episodes",
            genres: [
                "Action",
                "Adventure",
                "Drama",
                "Sci-Fi",
                "Mystery",
                "Mecha",
                "Slice of life",
                "Sports",
                "Psyclogical"
            ],
            hexColor: "#f1785d"
        )
    )
}
