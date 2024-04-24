//
//  AnimeListRow.swift
//  AniList
//
//  Created by Luann Marques Luna on 23/04/24.
//

import SwiftUI

struct AnimeListRow: View {
    
    var media: ShortAnimeViewModel
    
    let columns = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        HStack(alignment: .top) {
            VStack {
                AsyncImage(url: media.url) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 150)
                            .cornerRadius(8)
                    case .failure:
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 150)
                            .foregroundColor(.gray)
                            .cornerRadius(8)
                        
                    case .empty:
                        ProgressView()
                            .frame(width: 100, height: 150)
                    }
                }
                Spacer()
            }
            VStack(alignment: .leading, spacing: 10) {
                Text(media.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                Text(media.originalName)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: "face.smiling")
                        .foregroundColor(.green)
                    
                    VStack(alignment: .leading) {
                        
                        if let percent = media.approvePercentage {
                            Text(percent)
                                .font(.callout)
                        }
                        if let popularity = media.numberUsers {
                            Text(popularity)
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text(media.type ?? "")
                        if let episodios = media.numberEpisodes {
                            Text(episodios)
                        }
                    }
                    Spacer()
                }
                .font(.footnote)
                .foregroundColor(.gray)
                .fontWeight(.semibold)
                LazyVGrid(columns: columns, spacing: 10, content: {
                    ForEach(media.genres, id: \.self) { genre in
                        Text(genre)
                            .padding(.horizontal, 5)
                            .padding(.vertical, 3)
                            .background(Color(hex: media.hexColor))
                            .clipShape(Capsule())
                    }
                })
                .foregroundColor(.white)
                .font(.footnote)
                
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    AnimeListRow(
        media: ShortAnimeViewModel(
            anime: BaseAnimeInfo(
                id: 1,
                title: BaseAnimeInfo.Title(
                    english: "Cowboy Bebop",
                    native: "カウボーイビバップ"
                ),
                coverImage: BaseAnimeInfo.CoverImage(
                    extraLarge: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx1-CXtrrkMpJ8Zq.png",
                    color: "#f1785d"
                ),
                meanScore: 86, genres: [
                    "Action",
                    "Adventure",
                    "Drama",
                    "Sci-Fi",
                    "Mystery",
                    "Mecha",
                    "Slice of life",
                    "Sports",
                    "Psyclogical"
                ], episodes: 26,
                format: .tv,
                popularity: 345926
            )
        )
    )
    .scaledToFit()
}
